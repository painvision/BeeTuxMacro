. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if [ -z "${CONFIGURED+x}" ]; then
notify-send "BeeTux Macro" "❌ Go edit your configuration: ~/BeeTuxMacro/config.sh" -i ~/BeeTuxMacro/frosty_bee.png; xdg-open ~/BeeTuxMacro/config.sh
fi

touch ~/BeeTuxMacro/macro_log.txt

if [ ! -e lockfile ]; then
touch lockfile
SECONDS_GINGER=0
SECONDS_STOCKINGS=0
HIVE_SLOT=$(notify-send "☃️ Beetux Macro" "🍯 Claim a hive, then click a button what hive you claimed" -t 0 --action="1=1" --action="2=2" --action="3=3" --action="4=4" --action="5=5" --action="6=6" --action="exit=Cancel" --action="edit=Edit config" --action="github=Github" -i ~/BeeTuxMacro/frosty_bee.png)

if [ $HIVE_SLOT == exit ]; then
exit_macro
fi

if [ $HIVE_SLOT == edit ]; then
xdg-open ~/BeeTuxMacro/config.sh
exit_macro
fi

if [ $HIVE_SLOT == github ]; then
xdg-open https://github.com/painvision/BeeTuxMacro
exit_macro
fi

TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))

notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i ~/BeeTuxMacro/frosty_bee.png
echo "[$(date +"%H:%M:%S")] ⏯️ Macro setup started " >> ~/BeeTuxMacro/macro_log.txt
unhold_keys
ydotool click 0xC0
reset

if [ $AUTO_GINGERBREAD_HOUSE == 1 ]; then
from_hive_to_gingerbread_house_and_back
fi

if [ $AUTO_STOCKINGS == 1 ]; then
from_hive_to_stockings_and_back
fi
go_to_field
place_splinker
notify-send "☃️ Beetux Macro" "✅ Macro setup ended" -i ~/BeeTuxMacro/frosty_bee.png
echo "[$(date +"%H:%M:%S")] ✅ Macro setup ended" >> ~/BeeTuxMacro/macro_log.txt
screenshot macrostart
auto_dig_on
echo "[$(date +"%H:%M:%S")]  🌸 Farming pollen... " >> ~/BeeTuxMacro/macro_log.txt
while :
do
farm_pattern
if [[ "$(pixel_color $FULL_BACKPACK_PIXEL)" == "$FULL_BACKPACK_PIXEL_COLOR" ]]; then
echo "[$(date +"%H:%M:%S")]  🌸 Backpack is full" >> ~/BeeTuxMacro/macro_log.txt
auto_dig_off
back_to_hive
from_corner_to_hive $TRUE_HIVE_SLOT
echo "[$(date +"%H:%M:%S")]  ♻️ Converting in process... " >> ~/BeeTuxMacro/macro_log.txt
e
sleep $CONVERT_TIME
echo "[$(date +"%H:%M:%S")] ♻️ Converting ended " >> ~/BeeTuxMacro/macro_log.txt
screenshot convertend
if [[ $SECONDS_GINGER -ge 7200 && $AUTO_GINGERBREAD_HOUSE = 1 ]]; then
    from_hive_to_gingerbread_house_and_back
    SECONDS_GINGER=0
fi
if [[ $SECONDS_STOCKINGS -ge 3600 && $AUTO_STOCKINGS = 1 ]]; then
    from_hive_to_stockings_and_back
    SECONDS_STOCKINGS=0
fi
go_to_field
auto_dig_on
echo "[$(date +"%H:%M:%S")]  🌸 Farming pollen... " >> ~/BeeTuxMacro/macro_log.txt
fi
done
else
screenshot macroend
unhold_keys
rm lockfile
exit_macro
fi
