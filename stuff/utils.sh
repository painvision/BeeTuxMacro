. ~/BeeTuxMacro/config.sh

BASE_SPEED=32.2


function calculate_time() {
    local base_time=$1
    echo "scale=4; $base_time * $BASE_SPEED / $WALKSPEED" | bc
}

function check_backpack() {
    local screenshot_path="~/BeeTuxMacro/backpack.png"
    local text_path="~/BeeTuxMacro/backpack.txt"
    grim -g "$BACKPACK_COORDS" ~/BeeTuxMacro/backpack.png
    magick ~/BeeTuxMacro/backpack.png -colorspace Gray ~/BeeTuxMacro/backpack.png
    magick ~/BeeTuxMacro/backpack.png -channel RGB -negate +channel ~/BeeTuxMacro/backpack.png
    if [ ! -f ~/BeeTuxMacro/backpack.png ]; then
        echo "[$(date +"%H:%M:%S")] ❌ OecCR Error: Screenshot failed" >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
        return
    fi

    tesseract --psm 7 --oem 3 ~/BeeTuxMacro/backpack.png ~/BeeTuxMacro/backpack

    local ocr_text=$(cat ~/BeeTuxMacro/backpack.txt | tr -d '\n' | tr -d ' ')

    if [ -z "$ocr_text" ]; then
        echo "[$(date +"%H:%M:%S")] ❌ OCR Error: Empty text" >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
        return
    fi

    if [[ "$ocr_text" =~ ([0-9,]+)/([0-9,]+) ]]; then
        local current_raw="${BASH_REMATCH[1]}"
        local max_raw="${BASH_REMATCH[2]}"
        local current=$(echo "$current_raw" | tr -d ',')
        local max=$(echo "$max_raw" | tr -d ',')

        if [[ "$current" =~ ^[0-9]+$ ]] && [[ "$max" =~ ^[0-9]+$ ]] && [ "$max" -gt 0 ]; then
            local percentage=$(echo "scale=2; $current * 100 / $max" | bc 2>/dev/null)

            if [ -n "$percentage" ] && [ "$(echo "$percentage >= 0" | bc 2>/dev/null)" -eq 1 ]; then
                echo "[$(date +"%H:%M:%S")] 📊 OCR: '$ocr_text' → ${current}/${max} = ${percentage}%" >> ~/BeeTuxMacro/advanced.log.txt
                printf "%.2f" "$percentage"
                return
            else
                echo "[$(date +"%H:%M:%S")] ❌ OCR Error: Invalid percentage calculation for '$ocr_text'" >> ~/BeeTuxMacro/advanced.log.txt
            fi
        else
            echo "[$(date +"%H:%M:%S")] ❌ OCR Error: Invalid numbers in '$ocr_text'" >> ~/BeeTuxMacro/advanced.log.txt
        fi
    else
        echo "[$(date +"%H:%M:%S")] ❌ OCR Error: Pattern not found in '$ocr_text'" >> ~/BeeTuxMacro/advanced.log.txt
    fi

    local numbers=$(echo "$ocr_text" | grep -o '[0-9,]*' | tr -d '\n' | tr -d ' ')

    if [[ "$numbers" =~ ^([0-9,]+)([0-9,]+)$ ]]; then
        local current_raw="${BASH_REMATCH[1]}"
        local max_raw="${BASH_REMATCH[2]}"

        local current=$(echo "$current_raw" | tr -d ',')
        local max=$(echo "$max_raw" | tr -d ',')

        if [[ "$current" =~ ^[0-9]+$ ]] && [[ "$max" =~ ^[0-9]+$ ]] && [ "$max" -gt 0 ]; then
            local percentage=$(echo "scale=2; $current * 100 / $max" | bc 2>/dev/null)

            if [ -n "$percentage" ] && [ "$(echo "$percentage >= 0" | bc 2>/dev/null)" -eq 1 ]; then
                echo "[$(date +"%H:%M:%S")] 📊 OCR (alt): '$ocr_text' → ${current}/${max} = ${percentage}%" >> ~/BeeTuxMacro/advanced.log.txt
                printf "%.2f" "$percentage"
                return
            fi
        fi
    fi

    echo "[$(date +"%H:%M:%S")] ❌ OCR Error: All patterns failed for '$ocr_text'" >> ~/BeeTuxMacro/advanced.log.txt
    echo "0"
    return
}

function should_convert() {
    if [ "$CONVERT_AT_PERCENTAGE" -eq 0 ]; then
        echo "0"
        return
    fi

    local percentage=$(check_backpack)
    local timestamp=$(date +"%H:%M:%S")

    if ! [[ "$percentage" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "[$(date +"%H:%M:%S")] ❌ Validation Error: Invalid percentage format '$percentage'" >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
        return
    fi

    local compare_result=$(echo "$percentage >= $CONVERT_AT_PERCENTAGE" | bc 2>/dev/null)

    if [ "$compare_result" -eq 1 ] 2>/dev/null; then
        echo "[$(date +"%H:%M:%S")] ✅ Target reached: ${percentage}% >= ${CONVERT_AT_PERCENTAGE}%" >> ~/BeeTuxMacro/advanced.log.txt
        echo "1"
    else
        echo "[$(date +"%H:%M:%S")] 🔄 Still farming: ${percentage}% < ${CONVERT_AT_PERCENTAGE}%" >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
    fi
}

function get_current_pollen() {
    local screenshot_path="~/BeeTuxMacro/convert_check.png"
    local text_path="~/BeeTuxMacro/convert_check.txt"
    local timestamp=$(date +"%H:%M:%S")

    grim -g "$CONVERT_COORDS" ~/BeeTuxMacro/convert_check.png 2>/dev/null
    magick ~/BeeTuxMacro/convert_check.png-colorspace Gray ~/BeeTuxMacro/convert_check.png
    magick ~/BeeTuxMacro/convert_check.png -channel RGB -negate +channel ~/BeeTuxMacro/convert_check.png
    if [ ! -f ~/BeeTuxMacro/convert_check.png ]; then
        echo "[$(date +"%H:%M:%S")] ❌ Conversion OCR Error: Screenshot failed" >> ~/BeeTuxMacro/advanced.log.txt
        echo "-1"
        return
    fi
    tesseract --psm 7 --oem 3 ~/BeeTuxMacro/convert_check.png ~/BeeTuxMacro/convert_check

    local ocr_text=$(cat ~/BeeTuxMacro/convert_check.txt | tr -d '\n' | tr -d ' ')

    if [ -z "$ocr_text" ]; then
        echo "[$(date +"%H:%M:%S")] ❌ Conversion OCR Error: Empty text" >> ~/BeeTuxMacro/advanced.log.txt
        echo "-1"
        return
    fi

    if [[ "$ocr_text" =~ ([0-9,]+)/([0-9,]+) ]]; then
        local current_raw="${BASH_REMATCH[1]}"

        local current=$(echo "$current_raw" | tr -d ',')

        if [[ "$current" =~ ^[0-9]+$ ]]; then
            echo "[$(date +"%H:%M:%S")] 🔄 Conversion check: '$ocr_text' → current=${current}" >> ~/BeeTuxMacro/advanced.log.txt
            echo "$current"
            return
        fi
    fi

    local numbers=$(echo "$ocr_text" | grep -o '[0-9,]*' | head -1)
    if [ -n "$numbers" ]; then
        local current=$(echo "$numbers" | tr -d ',')
        if [[ "$current" =~ ^[0-9]+$ ]]; then
            echo "[$(date +"%H:%M:%S")] 🔄 Conversion check (alt): '$ocr_text' → current=${current}" >> ~/BeeTuxMacro/advanced.log.txt
            echo "$current"
            return
        fi
    fi

    echo "[$(date +"%H:%M:%S")] ❌ Conversion OCR Error: Pattern not found in '$ocr_text'" >> ~/BeeTuxMacro/advanced.log.txt
    echo "-1"
    return
}

function is_conversion_done() {
    local current_pollen=$(get_current_pollen)
    local timestamp=$(date +"%H:%M:%S")

    if [ "$current_pollen" -eq -1 ]; then
        echo "[$(date +"%H:%M:%S")] 🔄 Conversion: OCR error, waiting..." >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
        return
    fi

    if [ "$current_pollen" -eq 0 ]; then
        echo "[$(date +"%H:%M:%S")] ✅ Conversion completed! Pollen = 0" >> ~/BeeTuxMacro/advanced.log.txt
        echo "1"
    else
        echo "[$(date +"%H:%M:%S")] 🔄 Conversion in progress: Pollen = ${current_pollen}" >> ~/BeeTuxMacro/advanced.log.txt
        echo "0"
    fi
}

function place_splinker(
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
down_d
sleep $(calculate_time 1)
up_d
sleep 0.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
down_a
sleep $(calculate_time 1)
up_a
sleep 0.5
)

function reset (
ydotool key 1:1 1:0 19:1 19:0 28:1 28:0 -d 100
sleep 5
)

function zoom_out(
ydotool key 24:1 24:0
sleep 0.05
)

function auto_dig_on(
ydotool click 0x40
)

function screenshot(
if [ "$SCREENSHOTS" -eq 1 ]; then
    grim ~/BeeTuxMacro/log/$1-$(date +"%H-%M-%S_%d-%m-%Y").png
fi
)


function auto_dig_off(
ydotool click 0x80
)

function shift_lock_toggle(
ydotool key 42:1 42:0
sleep 0.1
)

function e(
ydotool key 18:1 18:0
)

function jump (
ydotool key 57:1 57:0 -d 50
)

function unhold_keys(
ydotool click 0x80
ydotool key 30:0 31:0 32:0 51:0 52:0 1:0 19:0 28:0 17:0
sleep 0.1
)

function down_d(
ydotool key 32:1
)

function up_d(
ydotool key 32:0
)


function down_w(
ydotool key 17:1
)

function up_w(
ydotool key 17:0
)

function down_a(
ydotool key 30:1
)

function up_a(
ydotool key 30:0
)

function up_s(
ydotool key 31:0
)

function down_s(
ydotool key 31:1
)


function camera_left(
ydotool key 51:1 51:0
sleep 0.1
)

function camera_right(
ydotool key 52:1 52:0
sleep 0.1
)

function farm_square(
down_a
sleep $(calculate_time 0.500000)
up_a
down_s
sleep $(calculate_time 0.500000)
up_s
down_d
sleep $(calculate_time 0.5)
up_d
down_w
sleep $(calculate_time 0.5)
up_w
)

function farm_snake(
down_s
sleep $(calculate_time 0.5)
up_s
down_a
sleep $(calculate_time 0.1)
up_a
down_w
sleep $(calculate_time 0.5)
up_w
down_a
sleep $(calculate_time 0.1)
up_a
down_s
sleep $(calculate_time 0.5)
up_s
down_a
sleep $(calculate_time 0.1)
up_a
down_w
sleep $(calculate_time 0.5)
up_w
down_a
sleep $(calculate_time 0.1)
up_a
down_s
sleep $(calculate_time 0.5)
up_s
down_a
sleep $(calculate_time 0.1)
up_a
down_w
sleep $(calculate_time 0.5)
up_w
down_a
sleep $(calculate_time 0.1)
up_a
down_s
sleep $(calculate_time 0.5)
up_s
down_d
sleep $(calculate_time 0.1)
up_d
down_w
sleep $(calculate_time 0.5)
up_w
down_d
sleep $(calculate_time 0.1)
up_d
down_s
sleep $(calculate_time 0.5)
up_s
down_d
sleep $(calculate_time 0.1)
up_d
down_w
sleep $(calculate_time 0.5)
up_w
down_d
sleep $(calculate_time 0.1)
up_d
down_s
sleep $(calculate_time 0.5)
up_s
down_d
sleep $(calculate_time 0.1)
up_d
down_w
sleep $(calculate_time 0.5)
up_w
down_d
sleep $(calculate_time 0.1)
up_d
)
