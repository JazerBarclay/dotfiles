#!/bin/sh

pushd ~

# Create ssh folder and key
mkdir -p ./.ssh
ssh-keygen -o -a 100 -t ed25519 -f .ssh/id_ed25519
popd

# Add wheel and tty_tickets to sudoers file
echo $'# One sudo login authorises all other terminals a free upgrade\nDefaults !tty_tickets\n\n# Uncomment below to allow sudo without password on wheel users\n%wheel ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# Setup dotfiles from github
git clone --bare https://github.com/jazerbarclay/dotfiles.git ./dotfiles
git --git-dir=./dotfiles --work-tree=. checkout -f
git --git-dir=./dotfiles --work-tree=. config --local status.showUntrackedFiles no
popd