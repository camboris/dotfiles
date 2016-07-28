#!/bin/bash

NB="LVDS1"
TELE="HDMI1"

xrandr --output $TELE --off --output $NB --auto
