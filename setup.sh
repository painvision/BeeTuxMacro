. ~/BeeTuxMacro/stuff/utils.sh

mkdir ~/BeeTuxMacro/variables/ 2>/dev/null
clear
figlet BeeTux
echo "https://github.com/painvision/BeeTuxMacro"
echo " "
check_update_git
echo " "
info "Checking dependencies..."

if ! command -v ydotool &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'ydotool' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "'ydotool' is not installed! "
exit 1
fi

if ! command -v bc &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'bc' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "bc is not installed!"
exit 1
fi

if ! command -v xrandr &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'xrandr' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "xrandr is not installed! Install package xorg-xrandr"
exit 1
fi

if ! command -v magick &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'imagemagick' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "imagemagick is not installed!"
exit 1
fi
success "All right!"
echo " "
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    info "Macro assumes you are using Wayland session"
    if ! command -v grim &> /dev/null; then
        notify-send "BeeTux Macro" "❌ Error: 'grim' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
        info "grim is not installed! If"
        exit 1
    fi
    grim test.png
    if [ ! -f ~/BeeTuxMacro/test.png ]; then
        info "Your WM/DE doesn't support grim!"
        echo "Which is a pixel detection utility macro uses for backpack detection, auto reconnect, etc. I highly recommmend you to use pure Wayland WM's and DE's like Hyprland, so you will get the most of the macro, but you can macro without those features"
        touch ~/BeeTuxMacro/variables/cant_use_pixel_detection
    fi
    success "Your DE/WM supports grim!"
else
note "Macro assumes you are using X11 session"
touch ~/BeeTuxMacro/variables/cant_use_pixel_detection
fi


echo ""
if [ -z "${CONFIGURED+x}" ]; then
notify-send "BeeTux Macro" "❌ Go edit your configuration: ~/BeeTuxMacro/config.sh" -i ~/BeeTuxMacro/frosty_bee.png
error "You didn't configure your macro! Go edit it (config.sh)"
exit 1
fi

if ! pidof ydotoold >/dev/null; then
    notify-send "BeeTux Macro" "❌ ydotoold is required to macro" -i ~/BeeTuxMacro/frosty_bee.png
    error "ydotoold is required to macro. Make this command running in a background, to start macroing ⬇"
    echo ""
    echo sudo /usr/bin/ydotoold --socket-path=\"/run/user/1000/.ydotool_socket\" --socket-own=\"1000:1000\"
    exit 1
fi
success "ydotoold working!"

echo ""
note "To start your macro, make a keybind with this bash command in your DE/WM:"
echo "bash -c $(pwd)/start.sh"
echo ""
note "To stop your macro, use this command:"
echo "bash -c $(pwd)/utils/close.sh"
