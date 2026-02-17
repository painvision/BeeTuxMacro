. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

rm -rf ~/BeeTuxMacro/variables/

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if [ -z "${CONFIGURED+x}" ]; then
notify-send "BeeTux Macro" "❌ Go edit your configuration: ~/BeeTuxMacro/config.sh" -i ~/BeeTuxMacro/frosty_bee.png; xdg-open ~/BeeTuxMacro/config.sh
fi

if ! pidof ydotoold >/dev/null; then
notify-send "BeeTux Macro" "❌ ydotoold is required to macro. See #Start/stop macro in README.md" -i ~/BeeTuxMacro/frosty_bee.png
exit 1
fi

if [ ! -e lockfile ]; then
mkdir ~/BeeTuxMacro/variables/
touch ~/BeeTuxMacro/macro_log.txt

touch ~/BeeTuxMacro/variables/should_stockings
touch ~/BeeTuxMacro/variables/should_gingerbread
rm ~/BeeTuxMacro/variables/sprinklers_placed

HIVE_SLOT=$(notify-send "☃️ Beetux Macro" "🍯 Claim a hive, then click a button what hive you claimed" -t 0 --action="1=1" --action="2=2" --action="3=3" --action="4=4" --action="5=5" --action="6=6" --action="exit=Cancel" --action="edit=Edit config" --action="github=Github" -i ~/BeeTuxMacro/frosty_bee.png)

TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))

echo TRUE_HIVE_SLOT=$TRUE_HIVE_SLOT > ~/BeeTuxMacro/variables/hive_slot.sh

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


notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i ~/BeeTuxMacro/frosty_bee.png
echo "[$(date +"%H:%M:%S")] ⏯️ Macro setup started " >> ~/BeeTuxMacro/macro_log.txt
touch lockfile

unhold_keys
ydotool click 0xC0
reset

if [[ $AUTO_STOCKINGS == 1 || $AUTO_GINGERBREAD_HOUSE == 1 ]]; then
bash -c ~/BeeTuxMacro/timer.sh &
fi

bash -c ~/BeeTuxMacro/pre_farm.sh


echo "[$(date +"%H:%M:%S")] ✅ Macro setup ended" >> ~/BeeTuxMacro/macro_log.txt

else
screenshot macroend
unhold_keys
rm lockfile
exit_macro
fi
