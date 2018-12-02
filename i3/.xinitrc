if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

udiskie &
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xcape
xflux -l -31 -g -61
exec i3 
