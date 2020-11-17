BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/charge_full
BAT_NOW=$BATPATH/charge_now
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
if [ $(( 100 * $bn / $bf )) -le 30 ]
then
    notify-send "Low Battery!" --icon="/usr/share/icons/Paper/512x512@2x/status/xfce-batter-low.png"
elif [ $(( 100 * $bn / $bf )) -eq 100 ]
then
    notify-send "Battery Full" --icon="/usr/share/icons/Paper/512x512@2x/status/xfce-battery-full.png"
fi
