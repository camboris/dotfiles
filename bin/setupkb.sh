setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xcape
