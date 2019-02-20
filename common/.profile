#!/bin/sh

export BROWSER="firefox"
export EDITOR="vim"
export VISUAL="vim"
export BIB="~/Dokumente/bibliography.bib"

[ -f ~/.bashrc ] && source ~/.bashrc

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    ~/bin/misc/unix.sh
    echo Shell is on tty1. Starting X window system...
    startx
fi

sudo -n loadkeys ~/bin/util/ttymaps.kmap
