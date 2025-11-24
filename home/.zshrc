# Setup completion
autoload -Uz compinit && compinit -D
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Make navigation more convenient
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -e

# Setup history saving
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Customize prompt
PS1='%B%F{5}%C%f %F{blue}>%f%b '

# Enable plugins
IS_ARCH="$(grep Arch /etc/os-release)"
IS_VOID="$(grep Void /etc/os-release)"

if [[ "$IS_ARCH" != "" || "$IS_VOID" != "" ]]; then
  source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -a"
alias asl="ls -la"
alias md="mkdir"
alias rd="rm -r"

alias S="sudo xbps-install"
alias R="sudo xbps-remove -o"
