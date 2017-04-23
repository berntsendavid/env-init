#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
for filename in `find ./dotfiles -maxdepth 1 -type f -name '.*'`; do
	file=$(basename "$filename")
	if [ -f ~/$file ]; then rm ~/$file; fi
    	ln -s $DIR/dotfiles/$file ~/$file
done

