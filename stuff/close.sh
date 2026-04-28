. ~/BeeTuxMacro/stuff/utils.sh

unhold_keys 2>/dev/null
unhold_keys 2>/dev/null
unhold_keys 2>/dev/null
rm ~/BeeTuxMacro/lockfile 2>/dev/null
rm ~/BeeTuxMacro/stuff/lockfiletest 2>/dev/null
notify-send "Beetux Macro" "‼️ Macro cancelled" -i ~/BeeTuxMacro/frosty_bee.png
for i in {1..10}:
do
    pkill -f test.sh 2>/dev/null
    pkill -f start.sh 2>/dev/null
    pkill -f farm.sh 2>/dev/null
    pkill -f pre_farm.sh 2>/dev/null
    pkill -f check_inventory.sh 2>/dev/null
    pkill -f after_farm.sh 2>/dev/null
    pkill -f timer.sh 2>/dev/null
    pkill -f connect_checker.sh 2>/dev/null
    pkill -f get_loot.sh 2>/dev/null

done
error "Macro cancelled by user (close.sh call)"
