#!/bin/bash
. ~/BeeTuxMacro/config.sh
. ~/BeeTuxMacro/stuff/utils.sh

echo "=== Testing Backpack OCR ==="
echo "Coordinates: $BACKPACK_COORDS"
echo "Target percentage: $CONVERT_AT_PERCENTAGE%"

# Сделаем несколько попыток
for i in {1..3}; do
    echo ""
    echo "Attempt $i:"

    # Делаем скриншот и распознаем
    grim -g "$BACKPACK_COORDS" ~/BeeTuxMacro/test_$i.png
    tesseract --psm 7 --oem 3 ~/BeeTuxMacro/test_$i.png ~/BeeTuxMacro/test_text_$i

    echo "OCR Text: $(cat ~/BeeTuxMacro/test_text_$i.txt)"

    percentage=$(check_backpack)
    echo "Percentage: $percentage%"
done

# Проверим текущий статус
echo ""
echo "=== Current Status ==="
debug_backpack
