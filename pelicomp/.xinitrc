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

# we have Xresources for dpi setting, so this will execute
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


#############################
#    my startup programs    #
#############################

# set default cursor (Xmonad doesn't do this by default)
#xsetroot -cursor_name crosshair

# turn numlock on
numlockx &

# set keyboard delay and repeat rate
xset r rate 200 50

# launch the emacs daemon
emacs --daemon &

# initialise the mouse
/home/hamish/src/useful-scripts/pelicomp/mouse &!

# launch picom
#picom &!

# set desktop background
feh --bg-center ~/src/useful-scripts/pelicomp/wallpapers/eboy_big.png

# set the dwm status bar in motion
#~/src/foss/dwm/dwmbar &!

exec i3
