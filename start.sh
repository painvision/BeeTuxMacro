export MACRO_DIR=$(cd $(dirname "$BASH_SOURCE[0]") && pwd)

. $MACRO_DIR/stuff/utils.sh
. $MACRO_DIR/stuff/paths.sh
. $MACRO_DIR/config.sh

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i $MACRO_DIR/frosty_bee.png
error "'ydotool' is not installed! "
exit 1
fi

if ! pidof ydotoold >/dev/null; then
    notify-send "BeeTux Macro" "❌ ydotoold is required to macro. Run setup.sh for more info" -i $MACRO_DIR/frosty_bee.png
fi

check_update_git

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'bc' is not installed" -i $MACRO_DIR/frosty_bee.png
error "bc is not installed!"
exit 1
fi

if ! command -v xrandr &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'xrandr' is not installed" -i $MACRO_DIR/frosty_bee.png
error "xrandr is not installed! Install package xorg-xrandr"
fi

if ! command -v magick &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'imagemagick' is not installed" -i $MACRO_DIR/frosty_bee.png
exit 1
fi

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    grim -g "1,1 50x50" $MACRO_DIR/test.png
    if [ ! -f $MACRO_DIR/test.png ]; then
        touch $MACRO_DIR/variables/cant_use_pixel_detection
    fi
    rm $MACRO_DIR/test.png
else
notify-send "BeeTux Macro" "❌ Pixel detection unsupported. Use sandbox (README.md)" -i $MACRO_DIR/frosty_bee.png
touch $MACRO_DIR/variables/cant_use_pixel_detection
fi

if [ ! -e lockfile ]; then
touch $MACRO_DIR/lockfile

touch $MACRO_DIR/variables/backpack_detection_mode
echo $BACKPACK_DETECTION_MODE > $MACRO_DIR/variables/backpack_detection_mode

if [ ! -f variables/cant_use_pixel_detection ]; then
bash -c $MACRO_DIR/connect_checker.sh &
fi

rm $MACRO_DIR/variables/sprinklers_placed 2>/dev/null

if [[ $AUTO_FIND_HIVE = 0 || -f $MACRO_DIR/variables/cant_use_pixel_detection ]]; then
    touch $MACRO_DIR/lockfile
    HIVE_SLOT=$(notify-send "☃️ Beetux Macro" "🍯 Claim a hive, then click a button what hive you claimed" -t 0 --action="1=1" --action="2=2" --action="3=3" --action="4=4" --action="5=5" --action="6=6" --action="exit=Cancel" --action="edit=Edit config" --action="github=Github" -i $MACRO_DIR/frosty_bee.png)

    TRUE_HIVE_SLOT=$((HIVE_SLOT - 1))
    echo TRUE_HIVE_SLOT=$TRUE_HIVE_SLOT > $MACRO_DIR/variables/hive_slot

    if [ $HIVE_SLOT == exit ]; then
        exit_macro
    fi

    if [ $HIVE_SLOT == edit ]; then
        xdg-open $MACRO_DIR/config.sh
        exit_macro
    fi

    if [ $HIVE_SLOT == github ]; then
        xdg-open https://github.com/painvision/BeeTuxMacro
        exit_macro
    fi

    notify-send "☃️ Beetux Macro" "⏯️ Macro setup started" -i $MACRO_DIR/frosty_bee.png
    touch lockfile 2>/dev/null

    unhold_keys
    ydotool click 0xC0
    reset
    down_w
    wait 4
    up_w
else
    touch $MACRO_DIR/lockfile
    RESPONSE=$(notify-send "☃️ Beetux Macro" "🍯 Auto Hive enabled!" -t 15000 --action="cancel=Cancel" -i $MACRO_DIR/frosty_bee.png) & find_hive
    if [ $RESPONSE == cancel ]; then
        exit_macro
    fi
fi

bash -c $MACRO_DIR/pre_farm.sh &
exit 1

else
    rm lockfile 2>/dev/null
    exit_macro 2>/dev/null
    exit 1
fi
