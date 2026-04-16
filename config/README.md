# Configuration Files

This directory contains useful configuration files for Hyak.  You
don't need to use these, but you may find them useful. Feel free to
add your own configuration files here, and please add an explanation
below if you do.


## Emacs

If you use emacs, feel free to copy the `emacs.el` file to `~/.emacs`
on Hyak. You will also want to create a directory `~/.emacs.d` if you
use this configuration file as-is.


## BASH

The `bash_profile` file can be copied to `~/.bash_profile` to set up
some paths for Hyak. The profile here will set the following variables
and ensure that all of the referenced paths exist and have appropriate
permissions.

* `$SCRUBBED` is your user-directory in the temporary scrubbed
  filesystem.
* `$APPTAINER_CACHEDIR` is a directory in the scrubbed filesystem for
  your apptainer cache.
* `$NBENLAB_HOME` is the `/gscratch/nbenlab` directory.
* `$NBENLAB_SCRUBBED` is the `/gscratch/scrubbed/nbenlab` directory.
* `$NBENLAB_TMPDIR` is a directory in the `$NBENLAB_SCRUBBED`
  directory that can be used for temporary files.

The profile also adds the `~/bin`, `~/.local/bin`, and
`${NBENLAB_HOME}/bin` directories to your path.

