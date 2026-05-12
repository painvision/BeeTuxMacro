export MACRO_DIR=$(cd $(dirname "$BASH_SOURCE[0]") && pwd)

echo " _              _____"
echo "| |__   ___  __|_   _|   ___  __"
echo "| '_ \ / _ \/ _ \| || | | \ \/ /"
echo "| |_) |  __/  __/| || |_| |>  <"
echo "|_.__/ \___|\___||_| \__,_/_/\_\""
echo "sandbox. Open source BSS macro for Linux"
echo "https://github.com/painvision/BeeTuxMacro"

if ! command -v hyprland &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'hyprland' is not installed" -i $MACRO_DIR/frosty_bee.png
error "'hyprland' is not installed! "
exit 1
fi

if ! command -v foot &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'foot' is not installed" -i $MACRO_DIR/frosty_bee.png
error "foot is not installed!"
exit 1
fi

width=$(xrandr | grep "*" | awk '{print $1}' | cut -dx -f1)
height=$(xrandr | grep "*" | awk '{print $1}' | cut -dx -f2)
echo "monitor = ,"$width"x"$height",auto,1" > $MACRO_DIR/sandbox/monitor.conf

TEMPFILE=$(mktemp)
sed "s|MACRO_DIR|$MACRO_DIR|g" $MACRO_DIR/sandbox/conf.conf > $TEMPFILE
hyprland -c $TEMPFILE
