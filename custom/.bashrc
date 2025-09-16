# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

# Put your fun stuff here.
export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"
source "$HOME"/.venv/bin/activate

# uv
export PATH="/home/rthetapi/.local/bin:$PATH"

alias ls="eza -F -gh --group-directories-first --git --git-ignore --icons --hyperlink"
alias lh='ls -d .*'
alias lD='ls -D'
alias lc='ls -1'

alias ll='ls -l'
alias la='ll -a'

alias lA='ll --sort=acc'
alias lC='ll --sort=cr'
alias lM='ll --sort=mod'
alias lS='ll --sort=size'
alias lX='ll --sort=ext'
alias llm='lM'

alias l='la -a'
alias lsa='l'
alias lx='l -HimUuS'
alias lxa='lx -Z@'

alias lt='ls -T'
alias tree=lt

eval "$(zoxide init bash --cmd cd --hook pwd)"

alias cat='bat --paging=never --theme="Catppuccin Mocha"'
alias df='duf'
alias du='dua i'
alias grep='rg'
