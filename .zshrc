# start tmux on terminal start
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR=nvim
alias vim='nvim'
alias hibernate='sudo systemctl hibernate'

# use vim bindings in prompmt
set -o vi

# get configurations
export LESS="-R" # fixes colouring on git graph
alias conflicts='git diff --name-only --deff-filter=U'
alias gti='git' # i suck at typing

alias sl='ls'

# colorize less
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# ack is grep 2.0
alias grep='ack'

# enable fuzzyfind
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
