# clear history
> $HOME/.bash_history && history -c

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

if [ -f $HOME/.profile ]; then
  . $HOME/.profile
fi
