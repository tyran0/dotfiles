#!/usr/bin/env bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" > /dev/null 2>&1; pwd -P )"

is_symbolic_link() {
	local file_or_directory="$1"

	if [ -d $file_or_directory ] || [ -f $file_or_directory ]
	then
		stat $file_or_directory | grep "symbolic link" >/dev/null \
			&& return 0
	fi

	return 1
}

create_symbolic_link() {
	local source="$1"
	local destination="$2"

	if ! is_symbolic_link $destination
	then
		rm $destination 2> /dev/null
		ln -s $source $destination
		echo "Created symlink '$destination'!"
	else
		echo "Symlink '$destination' already exists, no need to do anything!"
	fi
}

# Bash files

for file in \
	.profile \
	.bash_profile \
	.bash_aliases
do
	create_symbolic_link "$SCRIPT_PATH/bash/$file" "$HOME/$file"
done

# Configs

[ -d "$HOME/.config" ] || mkdir "$HOME/.config"

[ -d "$HOME/.config/git" ] || mkdir "$HOME/.config/git"
create_symbolic_link "$SCRIPT_PATH/.gitconfig" "$HOME/.config/git/config"

echo "Setup is finished!"
