#!/bin/sh

pushd /home/`whoami`
git clone --bare https://github.com/jazerbarclay/dotfiles.git /home/`whoami`/dotfiles
git --git-dir=/home/`whoami`/dotfiles --work-tree=/home/`whoami` checkout -f
git --git-dir=/home/`whoami`/dotfiles --work-tree=/home/`whoami` config --local status.showUntrackedFiles no
popd
