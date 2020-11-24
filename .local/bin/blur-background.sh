#! /bin/sh

bspc subscribe | while read -r line; do
    node_num=$(bspc query --nodes --desktop | wc -l)
    if [ "$node_num" != "0" ]; then
	feh --bg-scale ~/blur.png
    else
	feh --bg-scale ~/Pictures/wallpapers/florest-stair2.jpg
    fi
done;
