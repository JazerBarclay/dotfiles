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

PROMPT='[%n@t440p] '
RPROMPT=\$vcs_info_msg_0_' %?'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Source shortcuts and aliases
export PATH=$PATH:~/.scripts
source ~/.config/zsh/.zsh_alias
