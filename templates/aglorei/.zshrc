export ZSH=$HOME/.oh-my-zsh

# homebrew
[ -d /opt/homebrew/bin ] && PATH="/opt/homebrew/bin:$PATH"

ZSH_THEME=""
plugins=(git fasd fzf)

# do not autoupdate
zstyle ':omz:update' mode disabled

source "$ZSH/oh-my-zsh.sh"

# base16
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"

# geometry
source "$HOME/.geometry/geometry.zsh"
GEOMETRY_STATUS_SYMBOL_COLOR_HASH=true

# list
alias ls="{{ 'ls -G' if ansible_system == 'Darwin' else 'ls --color' }}"
alias ll="ls -alhHF"

# grep
alias egrep="egrep --color"
alias fgrep="fgrep --color"
alias grep="grep --color"

# file utils
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"

# rake
alias rake="noglob rake"

# tmux
alias hack="tmux a -t hack || tmux new -s hack"
function bb() {
  if [[ ! -f $HOME/.ssh/config ]]; then
    echo >&2 "Could not find $HOME/.ssh/config. Bye."
    return 1
  fi

  ssh_hosts=( $(egrep "Host\b" $HOME/.ssh/config | sed -e "s/Host //g") )

  if [[ ! "${ssh_hosts[*]}" == *"${1}"* ]]; then
    echo >&2 "Could not find ${1} host in $HOME/.ssh/config. Bye."
    return 1
  fi
  tmux a -t $1 || tmux new -s $1 -n $1 "ssh ${1}"
}

# lazy
alias fucking="sudo"

# export GPG tty
export GPG_TTY=$(tty)

# zsh-syntax-highlighting
source "$HOME/.zsh/zsh-syntax-highlighting.zsh"
