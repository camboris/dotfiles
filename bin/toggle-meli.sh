if xrandr | grep "^DP-1 connected"
then
    xrandr --output DP-1 --mode 1920x1080 --pos 1366x0 --rotate normal --output HDMI-1 --off --output eDP-1 --primary --mode 1366x768 --pos 1672x1080 --rotate normal
else
    xrandr --output eDP-1 --auto --output DP-1 --off
fi
feh --bg-max ~/dotfiles/i3extra/fondo-ballena.jpg
