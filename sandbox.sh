echo " _              _____"
echo "| |__   ___  __|_   _|   ___  __"
echo "| '_ \ / _ \/ _ \| || | | \ \/ /"
echo "| |_) |  __/  __/| || |_| |>  <"
echo "|_.__/ \___|\___||_| \__,_/_/\_\""
echo "sandbox. Open source BSS macro for Linux"
echo "https://github.com/painvision/BeeTuxMacro"

if ! command -v hyprland &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'hyprland' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "'hyprland' is not installed! "
exit 1
fi

if ! command -v kitty &> /dev/null; then
notify-send "BeeTux Macro" "❌ Error: 'bc' is not installed" -i ~/BeeTuxMacro/frosty_bee.png
error "kitty is not installed!"
exit 1
fi
hyprland -c ~/BeeTuxMacro/sandbox/conf.conf
