#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#

#echo "$(tput setaf 3)"$USER@$HOSTNAME"$(tput sgr0)"
#echo "[41m[30m█▓▒░[42m[31m█▓▒░[43m[32m█▓▒░[44m[33m█▓▒░[45m[34m█▓▒░[46m[35m█▓▒░[47m[36m█▓▒░[37m█[0m▒░"
#echo "[0m  hello [36mmario[0m, i'm [34mthinkpad
 #[0m"

if [ "$EUID" -ne 0 ]
    then export PS1="\[$(tput setaf 2)\]\W\[$(tput sgr0)\] > "
    else export PS1="\[$(tput setaf 2)\]\W\[$(tput sgr0)\] > "
fi

# Make pywal work
#(cat ~/.cache/wal/sequences &)
export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/bin/util/:${HOME}/bin/misc/"
source /usr/share/bash-completion/bash_completion
shopt -s checkwinsize
set -o vi

# Aliases
alias q="exit"
alias v="vim"
alias r="ranger"
alias p="sudo pacman"
alias please="sudo !-1"
alias ls='ls --color=auto'
alias la="ls -a"
alias ll="ls -lh"
alias mario="beep -f 1000 -l 50 -n -f 1327 -l 300"
