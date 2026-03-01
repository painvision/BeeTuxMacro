. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh


mkdir ~/BeeTuxMacro/variables/ 2>/dev/null
clear
figlet BeeTux
echo "https://github.com/painvision/BeeTuxMacro"
echo " "

info "Checking dependencies..."
echo " "

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
echo [X] Error: 'ydotool' is not installed
exit 1
fi

success "ydotool installed!"

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'bc' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "bc is not installed!"
exit 1
fi

success "bc installed!"

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'xrandr' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "xrandr is not installed! Install package xorg-xrandr"
exit 1
fi

success "xrandr installed!"

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'imagemagick' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "imagemagick is not installed!"
exit 1
fi

success "imagemagick installed!"
echo ""

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    info "Macro assumes you are using Wayland session"
    if ! command -v grim &> /dev/null; then
        notify-send "BeeTux Macro" "❌ Error: 'grim' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
        info "grim is not installed! If"
        exit 1
    fi
else
note "Macro assumes you are using X11 session"
fi

echo ""
if [ -z "${CONFIGURED+x}" ]; then
notify-send "BeeTux Macro" "❌ Go edit your configuration: ~/BeeTuxMacro/config.sh" -i ~/BeeTuxMacro/frosty_bee.png; xdg-open ~/BeeTuxMacro/config.sh
error "You haven't configured your macro! Go edit your configuration (config.sh)"
exit 1
fi


info "Checking ydotoold state..."

if ! pidof ydotoold >/dev/null; then
notify-send "BeeTux Macro" "❌ ydotoold is required to macro" -i ~/BeeTuxMacro/frosty_bee.png
error "ydotoold is required to macro. Make this command running in a background, to start macroing ⬇"
echo ""
echo sudo /usr/bin/ydotoold --socket-path=\"/run/user/1000/.ydotool_socket\" --socket-own=\"1000:1000\"
exit 1
fi
success "ydotoold working!"
echo ""
check_update_git
echo ""
info "Everything's okay to start!"
info "Sending notification..."
echo ""

if [ ! -e lockfile ]; then

if [[ $AUTO_STOCKINGS = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_stockings
fi

if [[ $AUTO_GINGERBREAD_HOUSE = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_gingerbread
fi

if [[ $AUTO_MOBS = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_mobs
fi

if [[ $AUTO_WREATH = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_wreath
fi

if [[ $AUTO_WEALTH_CLOCK = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_wealth
fi

rm ~/BeeTuxMacro/variables/sprinklers_placed 2>/dev/null

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
touch lockfile 2>/dev/null

unhold_keys
ydotool click 0xC0
reset
down_w
wait 4
up_w

if [[ $AUTO_STOCKINGS == 1 || $AUTO_GINGERBREAD_HOUSE == 1 || $AUTO_MOBS = 1 || $AUTO_WREATH = 1 || $AUTO_WEALTH_CLOCK = 1 ]]; then
bash -c ~/BeeTuxMacro/timer.sh &
fi

bash -c ~/BeeTuxMacro/pre_farm.sh

else
rm lockfile 2>/dev/null
exit_macro
rm -rf ~/BeeTuxMacro/variables/ 2>/dev/null
fi
