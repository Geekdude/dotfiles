# Dotfiles

This dotfile repository is setup based on [Using Git and Github to Manage Your Dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/).
To learn more about this dotfiles setup, see [my blog post on it](https://geekdude.github.io/tech/dotfiles/).

This repository includes all of my custom dotfiles.
This repository should be cloned to your home directory so that the path is `~/dotfiles/`.
The included setup script creates symlinks from your home directory to the files which are located in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a `~/dotfiles_old/` directory if you already have any dotfiles of the same name as the dotfile symlinks being created in your home directory.
I have this feature commented out currently, since I don't use it.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/` (commented out)
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory

## Installation

### Short installation (Deprecated)

This method shows the general setups to setup the dotfiles, but is too simplistic if using private repositories.

``` bash
git clone --recursive git@bitbucket.org:Geekdude/dotfiles.git
cd ~/dotfiles
./makesymlinks.sh
./install-git-latexdiff.sh
./basic_apt_installs.sh
```

### Detailed installation

These detailed instructions are the steps I have to take when private repositories are used.

1. Add ssh keys to the system.
2. Clone dotfiles from bitbucket.

        $ git clone git@bitbucket.org:Geekdude/dotfiles.git

3. Start ssh agent.

        $ eval `ssh-agent`

4. Add ssh key.

        $ ssh-add

5. Run make sym links. Make any desired changed before running.

        $ ./makesymlinks.sh

6. Remove ~/.ssh

7. Add symbolic link to ~/.ssh

        $ ln -s dotfiles/ssh ~/.ssh

8. Run makesymlinks again.

        $ ./makesymlinks.sh

9. Run `basic_apt_installs.sh`.

8. Run makesymlinks again.

        $ ./makesymlinks.sh

