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


## GNU Screen

The [GNU Screen software tool](https://www.gnu.org/software/screen/) is a
useful way to keep a command or session running on Hyak after you log out.  By
running `screen` or `screen <COMMAND...>` you can start a screen instance that
stays running even when you log out. Interacting with screen is mostly
straightforward, but see [this screen cheatsheet](
https://vhernando.github.io/gnu-screen-quick-guide-cheatsheet) for a guide.

Note that one typically sends commands to screen using `CONTROL+a` followed by
another key sequence. If you use emacs or are a fan of the `^a` keybinding for
moving the cursor to the beginning of a line, then this keybinding is a
pain. For this reason, the `screenrc` file included here remaps the screen
control sequence to `CONTROL+o`. To send a literal `^o` you can press
`CONTROL+o` then `o` in sequence.

The `screenrc` file should be copied to `~/.screenrc` if you want to use it.


## Neuropythy

If you use [neuropythy](https://github.com/noahbenson/neuropythy), the
`npythyrc.json` file can be copied to `~/.npythyrc` (no JSON ending). This file
sets up neuropythy to know where to store its various datasets (in
`/gscratch/nbenlab/data`) so that we can share downloads. To access HCP data
you will still need to put your AWS credentials in th `~/.hcp-passwd` file.
