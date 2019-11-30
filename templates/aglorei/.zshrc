export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
plugins=(git fasd fzf)

source "$ZSH/oh-my-zsh.sh"

# base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fast-syntax-highlighting
source "$HOME/.fsh/fast-syntax-highlighting.plugin.zsh"

# geometry
GEOMETRY_SYMBOL_PROMPT="ℷ"
GEOMETRY_SYMBOL_RPROMPT="ℷ"
GEOMETRY_SYMBOL_EXIT_VALUE="ℷ"
PROMPT_GEOMETRY_COLORIZE_SYMBOL="true"
GEOMETRY_PROMPT_PREFIX=""
GEOMETRY_PROMPT_PLUGINS=(virtualenv exec_time git)
source "$HOME/.geometry/geometry.zsh"

# python2 brew
[ -d /usr/local/opt/python@2/bin ] && PATH="/usr/local/opt/python@2/bin:$PATH"

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
