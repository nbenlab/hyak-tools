#! /usr/bin/env bash
###############################################################################
# Inside the ooc.sif apptainer, this script turns on port forwarding to the
# requested unix domain socket, starts opencode, then at the end turns off the
# forwarding.
# Arguments are passed only via environment variables:
#  - OC_PORT
#  - OC_SOCK
#  - OC_WORK_DIR
#  - OC_CMD

set -euo pipefail

export OC_PORT="${OC_PORT:-4096}"
export OC_SOCK="${OC_SOCK:-${HOME}/.ooc/tunnels/opencode.sock}"
export OC_CMD="${OC_CMD:-ollama launch opencode}"
export OC_WORK_DIR="${OC_WORK_DIR:-$(mktemp -d)}"

# Go to the work directory.
cd "${OC_WORK_DIR}"

# Make sure the directory for the domain socket exists.
OC_SOCK_DIR="$(dirname "${OC_SOCK}")"
[ -d "${OC_SOCK_DIR}" ] || {
    mkdir -p "${OC_SOCK_DIR}"
    chmod 700 "${OC_SOCK_DIR}"
}

# Wait a few seconds then start port forwarding (but do all that in the
# background).
socat "UNIX-LISTEN:${OC_SOCK},fork,reuseaddr" "TCP:127.0.0.1:${OC_PORT}" \
    &> /dev/null &
SOCAT_PID=$!

# Cleanup handler
cleanup() {
    [[ -n "${SOCAT_PID:-}" ]] && kill "$SOCAT_PID" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

# Run OpenCode now.
exec $OC_CMD
