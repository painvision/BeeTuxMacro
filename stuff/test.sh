. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
unhold_keys
if [ ! -e lockfiletest ]; then
touch lockfiletest
notify-send "d"; from_pumpkin_to_hive; from_corner_to_hive 5
rm lockfiletest
else
notify-send "скрипт стопнут"
unhold_keys
rm lockfiletest
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
pkill -f "/bin/sh -c ~/BeeTuxMacro/utils/test.sh"
exit 0
fi

