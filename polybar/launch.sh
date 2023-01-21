#!/bin/bash

# author:	mintarchit
# version:	1.0

#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
#killall -q polybar

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

#echo "---" | tee -a /tmp/polybar1.log
cfg_path="-c=$HOME/.config/polybar/config.ini"
#polybar -r $cfg_path top 2>&1 | tee -a /tmp/polybar1.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload $cfg_path bar &
  done
else
  polybar --reload example &
fi

#echo "Bars launched..."

