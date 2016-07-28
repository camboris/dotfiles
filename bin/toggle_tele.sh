#!/bin/bash

NB="LVDS1"
TELE="HDMI1"

if(xrandr | grep "$TELE disconnected"); then
    xrandr --output $TELE --off --output $NB --auto
else
    xrandr --output $NB --off --output $TELE --auto
fi
