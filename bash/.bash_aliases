# general

alias cc="clear"

alias li="ls -1"
alias lai="ls -a1"

mkcd() {
  mkdir $1
  cd $1
}

alias refreshenv="source $HOME/.bash_profile"

# git

alias ga="git add"
alias gal="git add -A"
alias gcm="git commit -m"
alias gdif="git diff"
alias gstat="git status"

# pnpm

alias pn="pnpm"
alias pna="pnpm add"
alias pnd="pnpm add -D"
