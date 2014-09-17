Home Sweet Home
===============

Just a tool to syncronize dotfiles and any other shit between machines. The
idea is to use a github repository both because of the accesibility, the
history capabilities, and the coolness implied.  Coolness is a deciding factor
here. Deal with it.

Anyway, several other solutions exists to do the same, but they are really
overkill. The hability to merge several git repositories, sym link directories,
and share dot files clutters the interface, so the user has to deal with lots
of commands to do something really simple: sync files from a repository to the
computer, and maybe update them. So this is reinventing the wheel, but a
rounder one.

I have decided to implement also a mechanism to install the required packages
and configure the system. This can be accessed via the run command. Use this to
configure systems, puppet-like, but more lightweight. This is not done yet.

Usage
-----

Just run:

    hsh <command> [<set> ...]

where command can be:

  * install: make symbolic links for the files in the chosen set
  * uninstall: remove the symbolic links, and try to recover the originals
  * upload: upload all the files to the server
  * download: download files from the server, but not install
  * status: check server and local status

The sets allow you to group configuration files, because probably you dont
want to syncronize everything always. Yeah, keep it simple stupid.

Contributing
------------

Do not.

Example of Usage
----------------

A session should be like this:

    $ git clone https://github.com/guillermobox/hsh.git ~/.hsh/

Afterwards, just check the state of the sync'ed files:

    $ hsh install base

If you have incompatible sets, like a bashrc for the set 'base' and the set
'centos', the order of application will decide which will be installed:

    $ hsh install base centos

When the synchronization is finished, you can change any file in your home,
and:

    $ vim ~/.bashrc
    $ hsh upload "Now bashrc is more cool"

If you want to have the new files in another computer, just:

    $ hsh download
    $ hsh install base
