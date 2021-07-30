#!/bin/sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# Launch bars by monitor names
if type "xrandr"; then
  for m in $(xrandr --listactivemonitors | grep -v Monitors | grep -oE '[^ ]+$'); do
    polybar $m &
  done
fi

echo "Polybar launched..."

