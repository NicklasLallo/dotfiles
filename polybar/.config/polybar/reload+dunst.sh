#!/usr/bin/env sh

# Source generated colors.
source "${HOME}/.cache/wal/colors.sh"

reload_dunst() {
    pkill dunst && \
        dunst \
            -lb "$color0" \
            -nb "$color0" \
            -cb "$color0" \
            -lf "$color15" \
            -bf "$color15" \
            -cf "$color15" \
            -nf "$color15" \
            -fn "${DUNST_FONT:-Artwiz Lemon 7}" \
            -geometry "${DUNST_SIZES:-300x30-40+70}" &
}


main() {
    reload_dunst &
    # pgrep i3 && i3-msg reload &
}
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -c ${HOME}/.config/polybar/config2 laptop &
#polybar -c ${HOME}/.config/polybar/config2 center &
#polybar -c ${HOME}/.config/polybar/config2 left &
polybar -c ${HOME}/.config/polybar/config_3 title &
polybar -c ${HOME}/.config/polybar/config_3 cpu &
polybar -c ${HOME}/.config/polybar/config_3 memory & 
polybar -c ${HOME}/.config/polybar/config_3 temperature &
polybar -c ${HOME}/.config/polybar/config_3 workspace &
polybar -c ${HOME}/.config/polybar/config_3 volume &
polybar -c ${HOME}/.config/polybar/config_3 clock &
polybar -c ${HOME}/.config/polybar/config_3 tray &

echo "Bars launched..."

