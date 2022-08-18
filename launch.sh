#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if [ "$1" == "light" ]
then
	polybar -c $HOME/.config/polybar/bars/light-config nord-top &
	polybar -c $HOME/.config/polybar/bars/light-config nord-down &
else
	polybar -c $HOME/.config/polybar/bars/dark-config nord-top &
	polybar -c $HOME/.config/polybar/bars/dark-config nord-down &
fi

echo "Bars launched..."
