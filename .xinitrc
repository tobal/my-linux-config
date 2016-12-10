#!/bin/zsh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

exec i3 -V >> ~/local/var/log/i3log-$(date +'%F-%k-%M-%S') 2>&1
