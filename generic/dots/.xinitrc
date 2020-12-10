#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start picom
picom &!

# Set numlock to be on 
numlockx &

# display arrangement
xrandr --output DVI-I-0 --off --output DVI-I-1 --off --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-5 --off

# set backgrounds
feh --bg-center ~/src/useful-scripts/arch-desktop/eboy_ny.png \
    --bg-center ~/src/useful-scripts/arch-desktop/eboy_tok.png

# constrain wacom pad to rightmost screen
xsetwacom --set $( xsetwacom list devices | grep stylus | sed 's#.*id: \([0-9]*\).*#\1#' ) \
          maptooutput 1920x1080+1920+0

# set keyboard params
xset r rate 250 50

# start the emacs server. disown so that exiting x session doesn't kill emacs
emacs --daemon &!

# this is the last thing we do!
exec i3
