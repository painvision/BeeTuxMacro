. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'bc' calculator is not installed" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if ! command -v tesseract &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'tesseract' OCR is not installed" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if [ -z "${CONFIGURED+x}" ]; then
notify-send "BeeTux Macro" "❌ Go edit your configuration: ~/BeeTuxMacro/config.sh"; xdg-open ~/BeeTuxMacro/config.sh
fi

touch ~/BeeTuxMacro/macro_log.txt

if [ ! -e lockfile ]; then
touch lockfile
notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro setup started " >> ~/BeeTuxMacro/macro_log.txt
unhold_keys
reset
zoom_out; zoom_out; zoom_out; zoom_out; zoom_out
camera_left; camera_left; camera_right; camera_right

go_to_field

place_splinker
notify-send "☃️ Beetux Macro" "✅ Macro setup ended" -i ~/BeeTuxMacro/frosty_bee.png
echo "[$(date +"%H:%M:%S")] ✅ Macro setup ended" >> ~/BeeTuxMacro/macro_log.txt
echo "🎒 Farming until $CONVERT_AT_PERCENTAGE% full... " >> ~/BeeTuxMacro/macro_log.txt
screenshot macrostart
while :
do
if [ "$CONVERT_AT_PERCENTAGE" -eq 0 ]; then
    echo "⏱️ Farming by time ($DURATION seconds)... " >> ~/BeeTuxMacro/macro_log.txt
    end=$((SECONDS + DURATION))
else
    end=$((SECONDS + 3600))
fi

echo "[$(date +"%H:%M:%S")]  🌸 Farming pollen... " >> ~/BeeTuxMacro/macro_log.txt
auto_dig_on

check_counter=0
while [ $SECONDS -lt $end ]
do
    farm_pattern

    if [ "$CONVERT_AT_PERCENTAGE" -gt 0 ] && [ $((SECONDS % 10)) -eq 0 ]; then
        check_counter=$((check_counter + 1))

        if [ "$(should_convert)" -eq "1" ]; then
            echo "[$(date +"%H:%M:%S")]  🎯 Backpack reached ($CONVERT_AT_PERCENTAGE%) " >> ~/BeeTuxMacro/macro_log.txt
            break
        fi
        sleep 5
    fi
done

echo "🌸 Farming ended " >> ~/BeeTuxMacro/macro_log.txt
if [ "$CONVERT_AT_PERCENTAGE" -gt 0 ]; then
    current_percent=$(check_backpack)
    echo "[$(date +"%H:%M:%S")]  📊 Backpack at $current_percent% " >> ~/BeeTuxMacro/macro_log.txt
fi

sleep 5
echo "[$(date +"%H:%M:%S")]  🐝 Going back to hive " >> ~/BeeTuxMacro/macro_log.txt
back_to_hive
auto_dig_off
TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))
from_corner_to_hive $TRUE_HIVE_SLOT
echo "[$(date +"%H:%M:%S")]  ♻️ Converting in process... " >> ~/BeeTuxMacro/macro_log.txt
e #not a typo btw

sleep 2

convert_start=$SECONDS
convert_timeout=12
conversion_done=0
convert_check_counter=0

while [ $SECONDS -lt $((convert_start + convert_timeout)) ]
do
    if [ $((SECONDS % 10)) -eq 0 ]; then
        convert_check_counter=$((convert_check_counter + 1))

        if [ "$(is_conversion_done)" -eq "1" ]; then
            echo "[$(date +"%H:%M:%S")]  ✅ Conversion completed (pollen = 0) " >> ~/BeeTuxMacro/macro_log.txt
            conversion_done=1
            break
        else
            current_pollen=$(get_current_pollen)
            if [ "$current_pollen" -ne -1 ]; then
                echo "[$(date +"%H:%M:%S")] 📊 Current pollen: $current_pollen  " >> ~/BeeTuxMacro/macro_log.txt
            fi
        fi
    fi
    sleep 10
done

if [ "$conversion_done" -eq 0 ]; then
    echo "[$(date +"%H:%M:%S")] ⚠️ Conversion timeout reached, continuing... " >> ~/BeeTuxMacro/macro_log.txt
fi

sleep 5

echo "♻️ Converting ended " >> ~/BeeTuxMacro/macro_log.txt
screenshot convertend
go_to_field

done
else
notify-send "Beetux Macro" "⏯️ Macro stopped" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro stopped " >> ~/BeeTuxMacro/macro_log.txt
screenshot macroend
unhold_keys
rm lockfile
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
fi
