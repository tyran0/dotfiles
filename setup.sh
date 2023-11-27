#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

LOCAL_REPO=$SCRIPT_PATH

if [ "$1" == "-d" ]
then
  if [ "$2" == "" ]
  then
    echo Please provide a path to the local dotfiles repository!
    exit
  fi

  if [ ! -d "$2" ]
  then
    echo A directory you have provided does not exist!
    exit
  fi

  LOCAL_REPO="$HOME/$2"

  echo LOCAL_REPO=$LOCAL_REPO
fi

is_symbolic_link() {
  local file_or_directory=$1

  if [ -d $file_or_directory ] || [ -f $file_or_directory ]
  then
    stat $file_or_directory | grep "symbolic link" >/dev/null \
      && return 0
  fi

  return 1
}

create_symbolic_link() {
  local source=$1
  local destination=$2

  if ! is_symbolic_link $destination
  then
    rm $destination 2>/dev/null
    ln -s $source $destination
  else
    echo Symlink \'$destination\' already exists, no need to do anything!
  fi
}

# Bash files

for file in     \
  .profile      \
  .bash_profile \
  .bash_aliases
do
  create_symbolic_link "$LOCAL_REPO/bash/$file" "$HOME/$file"
done

# Configs

[ -d "$HOME/.config" ] || mkdir "$HOME/.config"

create_symbolic_link "$LOCAL_REPO/.vimrc" "$HOME/.config/vimrc"

[ -d "$HOME/.config/git" ] || mkdir "$HOME/.config/git"
create_symbolic_link "$LOCAL_REPO/.gitconfig" "$HOME/.config/git/config"

echo Setup is finished!
