setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xcape
