#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon="%{F#CAA}"

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

# Depending on the time of day & year readshift will report a "temperature"
# This temperature is then printed on the polybar in the top right corner with
# a hand picked color depending on how late it is.
if [[ -z $temp ]]; then
    echo "$icon%{F#677} ${temp}K"       # Greyed out (not running)
elif [[ $temp -ge 5500 ]]; then
    echo "$icon%{F#5AE} ${temp}K"       # Daytime
elif [[ $temp -ge 5300 ]]; then
    echo "$icon%{F#78D} ${temp}K"       # Daytime
elif [[ $temp -ge 5000 ]]; then
    echo "$icon%{F#88C} ${temp}K"       # Daytime
elif [[ $temp -ge 4500 ]]; then
    echo "$icon%{F#98A} ${temp}K"       # Evening
elif [[ $temp -ge 4200 ]]; then
    echo "$icon%{F#A88} ${temp}K"       # Evening
elif [[ $temp -ge 4000 ]]; then
    echo "$icon%{F#B76} ${temp}K"       # Evening
elif [[ $temp -ge 3700 ]]; then
    echo "$icon%{F#D64} ${temp}K"       # Nighttime
else
    echo "$icon%{F#F52} ${temp}K"      # Nighttime
fi
