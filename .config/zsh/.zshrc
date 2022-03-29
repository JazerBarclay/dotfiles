EDITOR=/usr/bin/vim

# Enable colors and change prompt:
autoload -U colors && colors

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b '

NEWLINE=$'\n'

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

PROMPT='[%F{208}%n%f@%F{226}%m%f] '
RPROMPT=\$vcs_info_msg_0_' %?'

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Dotfiles Config
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Auto cd option
setopt autocd

# Bind keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Source brew
export PATH="/usr/local/bin:${PATH}"

# Source user local binaries
export PATH="/home/jazer/.local/bin:${PATH}"

# Source shortcuts and aliases
export PATH=$PATH:~/.scripts
source ~/.config/zsh/.zsh_alias
