# Tools/Utilities for using UW's Hyak Cluster

This repository contains tools for using [UW's Hyak (HPC)
Cluster](https://hyak.uw.edu/).


## General Hyak Information

[The official Hyak documentation](https://hyak.uw.edu/docs/) contains
instructions for most basic use cases (submitting jobs, examining
allocations, etc.).


## Hyak SSH Setup

[SSH](https://en.wikipedia.org/wiki/Secure_Shell) is the preferred
method of connecting to and interacting with Hyak. I recommend the
following setup. In your `~/.ssh/config` file, make sure the following
block appears (make sure to copy indentation):

```
Host hyak
  HostName klone.hyak.uw.edu
  User <YOUR-UW-NETID>
```

Be sure to replace the `<YOUR-UW-NETID>` with your actual NetID. For
more information see [this page about the ssh-config file
format](https://www.ssh.com/academy/ssh/config).

If you need to forward a port from a worker node back to the computer
you're using to connect to Hyak, you can add another line at the end:

```
Host hyak
  HostName klone.hyak.uw.edu
  User <YOUR-UW-NETID>
  LocalForward 8989 /mmfs1/home/<YOUR-UW-NETID>/.hyak-tunnels/connection.sock
```

The final line connects the port 8989 on your local computer to the
unix domain socket file in the `~/.hyak-tunnels/connection.sock` file. You'll
need to create the `~/.hyak-tunnels` directory. When using Jupyter or similar
tools that need a port, you can direct them to open a unix domain socket
as `${HOME}/.hyak-tunnels/connection.sock` instead.


## The `nbenlab` Hyak Account

The `nbenlab` has a GPU slice in Hyak with partition name `gpu-l40s`
that contains the following resources:

* 32 CPUs
* 2 GPUs
* 364GB or RAM

These resources are reserved for the lab, but other users can use them
when we're not actively using them. When running commands like
`salloc`, `sbatch`, and `srun` for `nbenlab` projects, make sure to
set the account to `nbenlab` and the partition to `gpu-l40s` (e.g.,
`salloc -A nbenlab -p gpu-l40s ...`)

The lab also has 1TB of storage in `/gscratch/nbenlab`. For temporary
storage, please use `/gscratch/scrubbed` (e.g.,
`/gscratch/scrubbed/nbenlab` or `/gscratch/scrubbed/<YOUR-NETID>`). If
you need to use a `/gscratch/scrubbed` directory that doesn't exist
you should have permission to create it, but if you create the
`/gscratch/scrubbed/nbenlab` directory, please make sure the group for
this directory is `nbenlab`, that the permissions allow group
read-write-execute, that and the group sticky bit is set:

```bash
mkdir -p /gscratch/scrubbed/nbenlab
chgrp nbenlab /gscratch/scrubbed/nbenlab
chmod 775 /gscratch/scrubbed/nbenlab
chmod g+S /gscratch/scrubbed/nbenlab
```


# Using Apptainer

Hyak severely limits the number of files you are allowed to store in
your home directory or in the `/gscratch` directories. To get around
this limitation, and to be able to run jobs in containerized
installation environments, please use
[apptainer](https://apptainer.org/docs/user/main/). Apptainer is a
Docker-like tool that runs as your user-ID instead of as `root` and
thus ha different security requirements. It is often used on HPC
systems like Hyak where users can't run Docker due to root access
problems.

[The Hyak documentation on apptainer](
https://hyak.uw.edu/docs/tools/containers#apptainer-formerly-singularity)
covers its use on Hyak specifically.
