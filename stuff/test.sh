. ~/BeeTuxMacro/utils.sh
. ~/BeeTuxMacro/paths.sh
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
if [ ! -e lockfiletest ]; then
touch lockfiletest
notify-send "d"; from_hive_to_pine_tree_with_red_cannon
rm lockfiletest
else
notify-send "скрипт стопнут"
unhold_keys
rm lockfiletest
pkill -f "/bin/sh -c ~/BeeTuxMacro/test.sh"
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
fi

