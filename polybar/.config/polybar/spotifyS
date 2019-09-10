#!/bin/bash

if [ "$(playerctl --player=spotify status)" = "Playing" ]; then
  title=`exec playerctl --player=spotify metadata xesam:title`
  artist=`exec playerctl --player=spotify metadata xesam:artist`
  echo "  $title - $artist"
else
  echo "  "
fi
