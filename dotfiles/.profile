DEFAULT_USER=`whoami`
# exports
export PATH="./node_modules/.bin:${PATH}"
export PATH="${PATH}:/usr/local/bin"
export PATH="${PATH}:/usr/sbin"
export PATH="${PATH}:/bin"
export PATH="${PATH}:/Users/${DEFAULT_USER}/bin"
export PATH="${PATH}:/usr/bin"
export PATH="${PATH}:/sbin"
export PATH="${PATH}:/Library/TeX/texbin"
export PATH="$HOME/.yarn/bin:$PATH"
export GIT_EDITOR=vim

# Path to your oh-my-zsh installation.
export ZSH=/Users/${DEFAULT_USER}/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

source ~/.tokens
