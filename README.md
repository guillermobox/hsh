Home Sweet Home
===============

Just a tool to syncronize dotfiles between machines. The idea is to use a
github repository both because of the accesibility, the history capabilities,
and the coolness implied.  Coolness is a deciding factor here. Deal with it.

Anyway, several other solutions exist to do the same, but they are really
overkill. The ability to merge several git repositories, sym link directories,
and share dot files clutters the interface, so the user has to deal with lots
of commands to do something really simple: sync files from a repository to the
computer, and maybe update them. So I am reinventing the wheel, but a
rounder one.

I have decided to implement also a mechanism to install the required packages
and configure the system. This can be accessed via the run command. Use this to
configure systems, puppet-like, but more lightweight. This is not done yet, and
it may never be.

Usage
-----

Just run:

    hsh <command> [<set> ...]

where command can be:

  * status: check server and local status
  * install: make symbolic links for the files in the chosen set
  * uninstall: remove the symbolic links, and try to recover the originals
  * upload: upload all the files to the server
  * download: download files from the server, but not install
  * add: add a new dotfile to the repository, create a set if needed
  * rm: remove a dotfile from the repository, removing the set if empty
  * git: run any git command from inside the hsh repository (do expert things here)

The sets allow you to group configuration files, because probably you don't want
to syncronize everything always. But you don't have to explicitly create them,
they are automatically created and destroyed. Yeah, keep it simple stupid.

Contributing
------------

Do not.

Example of Usage
----------------

A session should be like this:

    $ git clone https://github.com/guillermobox/hsh.git ~/.hsh/

Afterwards, just install the base set, for example:

    $ hsh install base

If you have incompatible sets, like a bashrc for the set 'base' and the set
'centos', the last used will overwrite files from the previous one:

    $ hsh install centos

If you don't specify a set name, base will be used. You can specify only a file,
if you don't want to install or uninstall all the set, like this:

    $ hsh install base .bashrc

When the synchronization is finished, you can change any file in your home,
and:

    $ vim ~/.bashrc
    $ hsh status
    $ hsh upload "Now bashrc is even cooler"

If you want to have the new files in another computer that is already using
hsh to manage the home files, just:

    $ hsh download

You can create a startup script to call hsh download in your other machines, if
you are that lazy. Pity you. In any case, this is just a git repository, so you
can run any git command in there. To do so, use the git command in hsh:

    $ hsh git checkout home/base/.gitconfig

In order to add files, or remove them, from the repository, you can use the
commands add and rm, stating the set that you want to use. Like this:

    $ hsh add centos .bashrc
    $ hsh add centos .vimrc
    $ hsh rm base .vimrc

Don't worry about creating or destroying sets, that is my job. Mind your
bussiness.
