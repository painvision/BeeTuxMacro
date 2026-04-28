. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if ! pidof ydotoold >/dev/null; then
    notify-send "BeeTux Macro" "❌ ydotoold is required to macro. Run setup.sh for more info" -i ~/BeeTuxMacro/frosty_bee.png
fi

if [ ! -e lockfile ]; then
touch ~/BeeTuxMacro/lockfile

touch ~/BeeTuxMacro/variables/backpack_detection_mode
echo $BACKPACK_DETECTION_MODE > ~/BeeTuxMacro/variables/backpack_detection_mode

if [ ! -f variables/cant_use_pixel_detection ]; then
bash -c ~/BeeTuxMacro/connect_checker.sh &
fi

rm ~/BeeTuxMacro/variables/sprinklers_placed 2>/dev/null

if [[ $AUTO_FIND_HIVE = 0 || -f ~/BeeTuxMacro/variables/cant_use_pixel_detection ]]; then
    touch ~/BeeTuxMacro/lockfile
    HIVE_SLOT=$(notify-send "☃️ Beetux Macro" "🍯 Claim a hive, then click a button what hive you claimed" -t 0 --action="1=1" --action="2=2" --action="3=3" --action="4=4" --action="5=5" --action="6=6" --action="exit=Cancel" --action="edit=Edit config" --action="github=Github" -i ~/BeeTuxMacro/frosty_bee.png)

    TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))
    echo TRUE_HIVE_SLOT=$TRUE_HIVE_SLOT > ~/BeeTuxMacro/variables/hive_slot

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
    touch lockfile 2>/dev/null

    unhold_keys
    ydotool click 0xC0
    reset
    down_w
    wait 4
    up_w
else
    touch ~/BeeTuxMacro/lockfile
    RESPONSE=$(notify-send "☃️ Beetux Macro" "🍯 Auto Hive enabled!" -t 15000 --action="cancel=Cancel" -i ~/BeeTuxMacro/frosty_bee.png) & find_hive
    if [ $RESPONSE == cancel ]; then
        exit_macro
    fi
fi

bash -c ~/BeeTuxMacro/pre_farm.sh &
exit 1

else
    rm lockfile 2>/dev/null
    exit_macro 2>/dev/null
    exit 1
fi
