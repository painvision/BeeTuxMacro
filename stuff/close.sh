. ~/BeeTuxMacro/stuff/utils.sh
unhold_keys
notify-send "Beetux Macro" "😢 Macro cancelled" -i ~/BeeTuxMacro/frosty_bee.png
for i in {1..5}:
do
pkill -f test.sh
pkill -f start.sh
pkill -f farm.sh
pkill -f pre_farm.sh
pkill -f check_inventory.sh
pkill -f after_farm.sh
pkill -f timer.sh
done
