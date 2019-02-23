#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example &
#polybar -c ${HOME}/.config/polybar/config2 laptop &
polybar -c ${HOME}/.config/polybar/config2 centerLeft &
polybar -c ${HOME}/.config/polybar/config2 centerMiddle &
polybar -c ${HOME}/.config/polybar/config2 centerRight &
polybar -c ${HOME}/.config/polybar/config2 rightLeft &
polybar -c ${HOME}/.config/polybar/config2 rightRight &
#polybar -c ${HOME}/.config/polybar/config_3 title &
#polybar -c ${HOME}/.config/polybar/config_3 cpu &
#polybar -c ${HOME}/.config/polybar/config_3 memory & 
#polybar -c ${HOME}/.config/polybar/config_3 temperature &
#polybar -c ${HOME}/.config/polybar/config_3 workspace &
#polybar -c ${HOME}/.config/polybar/config_3 volume &
#polybar -c ${HOME}/.config/polybar/config_3 clock &
#polybar -c ${HOME}/.config/polybar/config_3 tray &

echo "Bars launched..."
