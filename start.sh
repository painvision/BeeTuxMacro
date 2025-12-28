. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if [ ! -e lockfile ]; then
touch lockfile
notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro setup started | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
unhold_keys
reset
zoom_out; zoom_out; zoom_out; zoom_out; zoom_out
camera_left; camera_left; camera_right; camera_right

go_to_field

place_splinker
notify-send "☃️ Beetux Macro" "✅ Macro setup ended" -i ~/BeeTuxMacro/frosty_bee.png
echo "✅ Macro setup ended | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
screenshot macrostart
while :
do
end=$((SECONDS + DURATION))
echo "🌸 Farming pollen... | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
auto_dig_on
while [ $SECONDS -lt $end ]
do
farm_pattern
done
echo "🌸 Farming ended | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
sleep 5
echo "🐝 Going back to hive | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
back_to_hive
auto_dig_off
TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))
from_corner_to_hive $TRUE_HIVE_SLOT
echo "♻️ Converting in process... | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
e #not a typo btw
sleep $CONVERT_TIME
echo "♻️ Converting ended | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
screenshot convertend
go_to_field
done
else
notify-send "Beetux Macro" "⏯️ Macro stopped" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro stopped | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
screenshot macroend
unhold_keys
rm lockfile
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
fi
