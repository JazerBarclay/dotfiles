#!/bin/sh

# Create ssh folder and key
mkdir -p /home/`whoami`/.ssh
pushd /home/`whoami`/.ssh
ssh-keygen -o -a 100 -t ed25519 -f /home/`whoami`/.ssh/id_ed25519
popd

# Add wheel and tty_tickets to sudoers file
echo $'# One sudo login authorises all other terminals a free upgrade\nDefaults !tty_tickets\n\n# Uncomment below to allow sudo without password on wheel users\n%wheel ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# Setup dotfiles from github
pushd /home/`whoami`
git clone --bare https://github.com/jazerbarclay/dotfiles.git /home/`whoami`/dotfiles
git --git-dir=/home/`whoami`/dotfiles --work-tree=/home/`whoami` checkout -f
git --git-dir=/home/`whoami`/dotfiles --work-tree=/home/`whoami` config --local status.showUntrackedFiles no
popd
