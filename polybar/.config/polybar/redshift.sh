#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon="%{F#CAA}"

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo "$icon%{F#677} ${temp}K"       # Greyed out (not running)
elif [[ $temp -ge 5500 ]]; then
    echo "$icon%{F#5AE} ${temp}"       # Daytime, temp≈5000+
elif [[ $temp -ge 5300 ]]; then
    echo "$icon%{F#78D} ${temp}"       # Daytime, temp≈5000+
elif [[ $temp -ge 5000 ]]; then
    echo "$icon%{F#88C} ${temp}"       # Daytime, temp≈5000+
elif [[ $temp -ge 4500 ]]; then
    echo "$icon%{F#98A} ${temp}"       # Evening, temp≈4000+
elif [[ $temp -ge 4200 ]]; then
    echo "$icon%{F#A88} ${temp}"       # Evening, temp≈4000+
elif [[ $temp -ge 4000 ]]; then
    echo "$icon%{F#B76} ${temp}"       # Evening, temp≈4000+
elif [[ $temp -ge 3700 ]]; then
    echo "$icon%{F#D64} ${temp}"       # Nighttime, temp<4000
else
    echo "$icon%{F#F52} ${temp}K"      # Nighttime, temp<3800
fi
