. ~/BeeTuxMacro/config.sh

BASE_SPEED=32.2

function calculate_time() {
    local base_time=$1
    echo "scale=4; $base_time * $BASE_SPEED / $WALKSPEED" | bc
}

# Функция для отладки OCR
function debug_backpack() {
    local screenshot_path="$HOME/BeeTuxMacro/backpack_debug.png"
    local text_path="$HOME/BeeTuxMacro/backpack_debug.txt"

    # Делаем скриншот
    grim -g "$BACKPACK_COORDS" "$screenshot_path"

    # Распознаем текст
    tesseract --psm 7 --oem 3 "$screenshot_path" "$HOME/BeeTuxMacro/backpack_debug"

    # Показываем результат
    echo "=== DEBUG BACKPACK OCR ==="
    echo "Screenshot saved to: $screenshot_path"
    echo "OCR Text:"
    cat "$text_path"
    echo ""

    # Проверяем проценты
    local percentage=$(check_backpack)
    echo "Detected percentage: $percentage%"

    if [ "$(should_convert)" -eq "1" ]; then
        echo "✅ Should convert!"
    else
        echo "❌ Continue farming"
    fi
}

# Функция для проверки заполнения рюкзака
function check_backpack() {
    local screenshot_path="$HOME/BeeTuxMacro/backpack.png"
    local text_path="$HOME/BeeTuxMacro/backpack.txt"
    local timestamp=$(date +"%H:%M:%S")

    # Делаем скриншот области с текстом
    grim -g "$BACKPACK_COORDS" "$screenshot_path" 2>/dev/null

    if [ ! -f "$screenshot_path" ]; then
        echo "[$timestamp] ❌ OCR Error: Screenshot failed" >> ~/BeeTuxMacro/macro_log.txt
        echo "0"
        return
    fi

    # Распознаем текст
    tesseract --psm 7 --oem 3 "$screenshot_path" "$HOME/BeeTuxMacro/backpack" 2>/dev/null

    # Читаем распознанный текст
    local ocr_text=$(cat "$text_path" 2>/dev/null | tr -d '\n' | tr -d ' ')

    if [ -z "$ocr_text" ]; then
        echo "[$timestamp] ❌ OCR Error: Empty text" >> ~/BeeTuxMacro/macro_log.txt
        echo "0"
        return
    fi

    # Пытаемся найти паттерн: число/число или число,число,число/число,число,число
    if [[ "$ocr_text" =~ ([0-9,]+)/([0-9,]+) ]]; then
        local current_raw="${BASH_REMATCH[1]}"
        local max_raw="${BASH_REMATCH[2]}"

        # Удаляем запятые и преобразуем в числа
        local current=$(echo "$current_raw" | tr -d ',')
        local max=$(echo "$max_raw" | tr -d ',')

        # Проверяем, что оба числа валидны
        if [[ "$current" =~ ^[0-9]+$ ]] && [[ "$max" =~ ^[0-9]+$ ]] && [ "$max" -gt 0 ]; then
            # Рассчитываем процент
            local percentage=$(echo "scale=2; $current * 100 / $max" | bc 2>/dev/null)

            if [ -n "$percentage" ] && [ "$(echo "$percentage >= 0" | bc 2>/dev/null)" -eq 1 ]; then
                # Логируем успешную проверку
                echo "[$timestamp] 📊 OCR: '$ocr_text' → ${current}/${max} = ${percentage}%" >> ~/BeeTuxMacro/macro_log.txt
                printf "%.2f" "$percentage"
                return
            else
                echo "[$timestamp] ❌ OCR Error: Invalid percentage calculation for '$ocr_text'" >> ~/BeeTuxMacro/macro_log.txt
            fi
        else
            echo "[$timestamp] ❌ OCR Error: Invalid numbers in '$ocr_text'" >> ~/BeeTuxMacro/macro_log.txt
        fi
    else
        echo "[$timestamp] ❌ OCR Error: Pattern not found in '$ocr_text'" >> ~/BeeTuxMacro/macro_log.txt
    fi

    # Альтернативный паттерн: если есть только числа с запятыми
    local numbers=$(echo "$ocr_text" | grep -o '[0-9,]*' | tr -d '\n' | tr -d ' ')

    if [[ "$numbers" =~ ^([0-9,]+)([0-9,]+)$ ]]; then
        local current_raw="${BASH_REMATCH[1]}"
        local max_raw="${BASH_REMATCH[2]}"

        local current=$(echo "$current_raw" | tr -d ',')
        local max=$(echo "$max_raw" | tr -d ',')

        if [[ "$current" =~ ^[0-9]+$ ]] && [[ "$max" =~ ^[0-9]+$ ]] && [ "$max" -gt 0 ]; then
            local percentage=$(echo "scale=2; $current * 100 / $max" | bc 2>/dev/null)

            if [ -n "$percentage" ] && [ "$(echo "$percentage >= 0" | bc 2>/dev/null)" -eq 1 ]; then
                # Логируем успешную проверку (альтернативный паттерн)
                echo "[$timestamp] 📊 OCR (alt): '$ocr_text' → ${current}/${max} = ${percentage}%" >> ~/BeeTuxMacro/macro_log.txt
                printf "%.2f" "$percentage"
                return
            fi
        fi
    fi

    echo "[$timestamp] ❌ OCR Error: All patterns failed for '$ocr_text'" >> ~/BeeTuxMacro/macro_log.txt
    echo "0"
    return
}

# Функция для проверки, нужно ли завершать фарм
function should_convert() {
    if [ "$CONVERT_AT_PERCENTAGE" -eq 0 ]; then
        echo "0"
        return
    fi

    local percentage=$(check_backpack)
    local timestamp=$(date +"%H:%M:%S")

    # Проверяем, что percentage - валидное число
    if ! [[ "$percentage" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "[$timestamp] ❌ Validation Error: Invalid percentage format '$percentage'" >> ~/BeeTuxMacro/macro_log.txt
        echo "0"
        return
    fi

    # Используем bc для сравнения чисел с плавающей точкой
    local compare_result=$(echo "$percentage >= $CONVERT_AT_PERCENTAGE" | bc 2>/dev/null)

    if [ "$compare_result" -eq 1 ] 2>/dev/null; then
        echo "[$timestamp] ✅ Target reached: ${percentage}% >= ${CONVERT_AT_PERCENTAGE}%" >> ~/BeeTuxMacro/macro_log.txt
        echo "1"
    else
        echo "[$timestamp] 🔄 Still farming: ${percentage}% < ${CONVERT_AT_PERCENTAGE}%" >> ~/BeeTuxMacro/macro_log.txt
        echo "0"
    fi
}

# Функция для проверки текущего значения пыльцы (левое число)
function get_current_pollen() {
    local screenshot_path="$HOME/BeeTuxMacro/convert_check.png"
    local text_path="$HOME/BeeTuxMacro/convert_check.txt"
    local timestamp=$(date +"%H:%M:%S")

    # Делаем скриншот области с текстом
    grim -g "$CONVERT_COORDS" "$screenshot_path" 2>/dev/null

    if [ ! -f "$screenshot_path" ]; then
        echo "[$timestamp] ❌ Conversion OCR Error: Screenshot failed" >> ~/BeeTuxMacro/macro_log.txt
        echo "-1"
        return
    fi

    # Распознаем текст
    tesseract --psm 7 --oem 3 "$screenshot_path" "$HOME/BeeTuxMacro/convert_check" 2>/dev/null

    # Читаем распознанный текст
    local ocr_text=$(cat "$text_path" 2>/dev/null | tr -d '\n' | tr -d ' ')

    if [ -z "$ocr_text" ]; then
        echo "[$timestamp] ❌ Conversion OCR Error: Empty text" >> ~/BeeTuxMacro/macro_log.txt
        echo "-1"
        return
    fi

    # Пытаемся найти паттерн: число/число
    if [[ "$ocr_text" =~ ([0-9,]+)/([0-9,]+) ]]; then
        local current_raw="${BASH_REMATCH[1]}"

        # Удаляем запятые и преобразуем в число
        local current=$(echo "$current_raw" | tr -d ',')

        # Проверяем, что число валидно
        if [[ "$current" =~ ^[0-9]+$ ]]; then
            echo "[$timestamp] 🔄 Conversion check: '$ocr_text' → current=${current}" >> ~/BeeTuxMacro/macro_log.txt
            echo "$current"
            return
        fi
    fi

    # Альтернативный паттерн: ищем любое число с запятыми
    local numbers=$(echo "$ocr_text" | grep -o '[0-9,]*' | head -1)
    if [ -n "$numbers" ]; then
        local current=$(echo "$numbers" | tr -d ',')
        if [[ "$current" =~ ^[0-9]+$ ]]; then
            echo "[$timestamp] 🔄 Conversion check (alt): '$ocr_text' → current=${current}" >> ~/BeeTuxMacro/macro_log.txt
            echo "$current"
            return
        fi
    fi

    echo "[$timestamp] ❌ Conversion OCR Error: Pattern not found in '$ocr_text'" >> ~/BeeTuxMacro/macro_log.txt
    echo "-1"
    return
}

# Функция для проверки, завершилась ли конвертация
function is_conversion_done() {
    local current_pollen=$(get_current_pollen)
    local timestamp=$(date +"%H:%M:%S")

    # Если получили -1 (ошибка OCR), считаем что еще не завершено
    if [ "$current_pollen" -eq -1 ]; then
        echo "[$timestamp] 🔄 Conversion: OCR error, waiting..." >> ~/BeeTuxMacro/macro_log.txt
        echo "0"
        return
    fi

    # Если текущая пыльца равна 0, конвертация завершена
    if [ "$current_pollen" -eq 0 ]; then
        echo "[$timestamp] ✅ Conversion completed! Pollen = 0" >> ~/BeeTuxMacro/macro_log.txt
        echo "1"
    else
        echo "[$timestamp] 🔄 Conversion in progress: Pollen = ${current_pollen}" >> ~/BeeTuxMacro/macro_log.txt
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
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
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
