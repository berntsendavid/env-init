# Path to your oh-my-zsh installation.
export ZSH=/Users/david.berntsen/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"
#ZSH_THEME="agnoster"

#
# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
plugins=(
		git
		brew
		brew-cask
		osx
		zsh-syntax-highlighting
		zsh-history-substring-search
)

export GIT_EDITOR=vim

source $ZSH/oh-my-zsh.sh

alias g11="g++ -std=c++11"
alias w11="g++ -std=c++11 -Wall -Wextra -Wpedantic"
alias emacs="/usr/local/Cellar/emacs-plus/24.5/Emacs.app/Contents/MacOS/Emacs -nw"
alias gemacs='/Applications/Emacs.app/Contents/MacOS/Emacs "$@" &'
alias roulette='if [[ $[ $RANDOM % 6 ] == 0 ]]; then echo "boom"; else echo "click"; fi'

DEFAULT_USER="david.berntsen"
source ~/src/chpy/chpy.sh
