function note(
echo -e "\\033[30;43m[i] $1\\033[0m"
)
function info(
echo -e "\\033[33m[i] $1\\033[0m"
)
clear
info "Welcome to BeeTux Macro start script!"
echo Right now, you are in what I call a \"Hyprland sandbox\". It ensures that everything works as intended.
echo
note "Make Hyprland (not kitty) window fullscreen!"
info "It is required to setup Hyprland's monitor config properly"
note "Press Enter when you are 100% sure Hyprland window is fullscreen"
read
width=$(xrandr | grep "*" | awk '{print $1}' | cut -dx -f1)
height=$(xrandr | grep "*" | awk '{print $1}' | cut -dx -f2)
echo "monitor = ,"$width"x"$height",auto,1" > ~/BeeTuxMacro/sandbox/monitor.conf
clear
info "Enter your password. Script will add your user in 'input' group and start ydotool daemon"
sudo usermod -aG input $USER 2>/dev/null
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000" &
hyprctl reload
sleep 2
clear
echo Before you go, read this:
echo
info "Mouse control might be quirky"
info "Roblox screen might not appear after you proceed. Move your mouse to make it appear"
info "Roblox can crash due to low memory"
echo
echo "Hotkeys you can use when joined BSS:"
note "CTRL + M = Start macro"
note "CTRL + Q = Stop macro"
echo
echo "Press Enter to launch Bee Swarm Simulator"
read
hyprctl notify 2 100000 0 "CTRL + M = Start macro | CTRL + Q = Stop macro"
rm ~/BeeTuxMacro/variables/cant_use_pixel_detection
org.vinegarhq.Sober "roblox-player:1+launchmode:play+gameinfo:1537690962+placelauncherurl:https%3A%2F%2Fassetgame.roblox.com%2Fgame%2FPlaceLauncher.ashx%3Frequest%3DRequestGame%26browserTrackerId%3D0%26placeId%3D1537690962%26isPlayTogetherGame%3Dfalse"
