. ~/BeeTuxMacro/stuff/utils.sh
unhold_keys
notify-send "Beetux Macro" "😢 Macro cancelled" -i ~/BeeTuxMacro/frosty_bee.png
echo "😢 Macro cancelled " >> ~/BeeTuxMacro/macro_log.txt
for i in {1..5}:
do
pkill -f test.sh
pkill -f start.sh
done
