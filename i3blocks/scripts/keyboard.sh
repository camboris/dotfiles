#! /bin/sh

LAYOUT=$(setxkbmap -query | awk '/layout/{print $2}')
VARIANT=$(setxkbmap -query | awk '/variant/{print $2}')

echo "$LAYOUT:$VARIANT"
