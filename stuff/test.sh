. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
unhold_keys
if [ ! -e lockfiletest ]; then
touch lockfiletest
check_backpack; notify-send "d"
rm lockfiletest
else
notify-send "скрипт стопнут"
unhold_keys
rm lockfiletest
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
pkill -f "/bin/sh -c ~/BeeTuxMacro/utils/test.sh"
exit 0
fi

