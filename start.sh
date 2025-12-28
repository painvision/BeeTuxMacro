. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

# Проверка наличия утилит
if ! command -v bc &> /dev/null; then
    notify-send "Beetux Macro" "❌ Error: 'bc' calculator is not installed" -i ~/BeeTuxMacro/frosty_bee.png
    exit 1
fi

if ! command -v tesseract &> /dev/null; then
    notify-send "Beetux Macro" "❌ Error: 'tesseract' OCR is not installed" -i ~/BeeTuxMacro/frosty_bee.png
    exit 1
fi

if ! command -v ydotool &> /dev/null; then
    notify-send "Beetux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
    exit 1
fi

# Создаем лог файл для проверок рюкзака
touch ~/BeeTuxMacro/macro_log.txt
echo "=== Backpack Check Log Started $(date +"%d.%m.%Y %H:%M:%S") ===" >> ~/BeeTuxMacro/macro_log.txt
echo "Target percentage: ${CONVERT_AT_PERCENTAGE}%" >> ~/BeeTuxMacro/macro_log.txt

if [ ! -e lockfile ]; then
touch lockfile
notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro setup started | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
echo "🔧 Walking speed: $WALKSPEED" >> ~/BeeTuxMacro/macro_log.txt
echo "🎒 Convert at: $CONVERT_AT_PERCENTAGE%" >> ~/BeeTuxMacro/macro_log.txt
echo "=== Farming session started ===" >> ~/BeeTuxMacro/macro_log.txt
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
if [ "$CONVERT_AT_PERCENTAGE" -eq 0 ]; then
    echo "⏱️ Farming by time ($DURATION seconds)..." >> ~/BeeTuxMacro/macro_log.txt
    echo "=== Time-based farming started ===" >> ~/BeeTuxMacro/macro_log.txt
    end=$((SECONDS + DURATION))
else
    echo "🎒 Farming until $CONVERT_AT_PERCENTAGE% full..." >> ~/BeeTuxMacro/macro_log.txt
    echo "=== Percentage-based farming started (target: ${CONVERT_AT_PERCENTAGE}%) ===" >> ~/BeeTuxMacro/macro_log.txt
    end=$((SECONDS + 3600))
fi

echo "🌸 Farming pollen... | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
auto_dig_on

# Счетчик проверок
check_counter=0

while [ $SECONDS -lt $end ]
do
    farm_pattern

    if [ "$CONVERT_AT_PERCENTAGE" -gt 0 ] && [ $((SECONDS % 10)) -eq 0 ]; then
        check_counter=$((check_counter + 1))
        echo "=== Backpack check #${check_counter} at $(date +"%H:%M:%S") ===" >> ~/BeeTuxMacro/macro_log.txt

        if [ "$(should_convert)" -eq "1" ]; then
            echo "🎯 Backpack reached target percentage ($CONVERT_AT_PERCENTAGE%)" >> ~/BeeTuxMacro/macro_log.txt
            echo "=== Farming completed after ${check_counter} checks ===" >> ~/BeeTuxMacro/macro_log.txt
            break
        fi

        # Добавляем небольшую задержку между проверками, чтобы не перегружать систему
        sleep 0.5
    fi
done

echo "🌸 Farming ended | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
if [ "$CONVERT_AT_PERCENTAGE" -gt 0 ]; then
    current_percent=$(check_backpack)
    echo "📊 Backpack at $current_percent% | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
    echo "=== Final backpack percentage: ${current_percent}% ===" >> ~/BeeTuxMacro/macro_log.txt
fi

sleep 5
echo "🐝 Going back to hive | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
back_to_hive
auto_dig_off
TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))
from_corner_to_hive $TRUE_HIVE_SLOT
echo "♻️ Converting in process... | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
echo "=== Conversion started ===" >> ~/BeeTuxMacro/macro_log.txt
e #not a typo btw

# Ждем начала конвертации (небольшая задержка)
sleep 2

# Мониторим процесс конвертации
convert_start=$SECONDS
convert_timeout=$((CONVERT_TIME + 60)) # добавляем 60 секунд на всякий случай
conversion_done=0
convert_check_counter=0

echo "🔍 Monitoring conversion progress..." >> ~/BeeTuxMacro/macro_log.txt
echo "=== Conversion monitoring started ===" >> ~/BeeTuxMacro/macro_log.txt

while [ $SECONDS -lt $((convert_start + convert_timeout)) ]
do
    # Проверяем каждые 10 секунд
    if [ $((SECONDS % 10)) -eq 0 ]; then
        convert_check_counter=$((convert_check_counter + 1))
        echo "=== Conversion check #${convert_check_counter} at $(date +"%H:%M:%S") ===" >> ~/BeeTuxMacro/macro_log.txt

        if [ "$(is_conversion_done)" -eq "1" ]; then
            echo "✅ Conversion completed (pollen = 0)" >> ~/BeeTuxMacro/macro_log.txt
            echo "=== Conversion completed after ${convert_check_counter} checks ===" >> ~/BeeTuxMacro/macro_log.txt
            conversion_done=1
            break
        else
            current_pollen=$(get_current_pollen)
            if [ "$current_pollen" -ne -1 ]; then
                echo "📊 Current pollen: $current_pollen" >> ~/BeeTuxMacro/macro_log.txt
            fi
        fi
    fi

    # Ждем 1 секунду перед следующей проверкой
    sleep 1
done

# Если конвертация не завершилась по таймауту
if [ "$conversion_done" -eq 0 ]; then
    echo "⚠️ Conversion timeout reached, continuing..." >> ~/BeeTuxMacro/macro_log.txt
    echo "=== Conversion timeout after ${convert_check_counter} checks ===" >> ~/BeeTuxMacro/macro_log.txt
fi

# Ждем дополнительные 5 секунд после завершения конвертации
sleep 5

echo "♻️ Converting ended | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
echo "=== Conversion session ended ===" >> ~/BeeTuxMacro/macro_log.txt
screenshot convertend
go_to_field

# Начинаем новый цикл фарма
echo "=== New farming cycle started ===" >> ~/BeeTuxMacro/macro_log.txt
done
else
notify-send "Beetux Macro" "⏯️ Macro stopped" -i ~/BeeTuxMacro/frosty_bee.png
echo "⏯️ Macro stopped | $(date +"%R %d.%m.%Y")" >> ~/BeeTuxMacro/macro_log.txt
echo "=== Macro stopped $(date +"%H:%M:%S") ===" >> ~/BeeTuxMacro/macro_log.txt
screenshot macroend
unhold_keys
rm lockfile
pkill -f "/bin/sh -c ~/BeeTuxMacro/start.sh"
fi
