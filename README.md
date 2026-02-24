<p align='center'>
<img src="https://github.com/painvision/BeeTuxMacro/blob/main/frosty_bee.png">
</p>
  
<h1 align='center'>
BeeTux Macro ☃️
</h1>

<p align='center'>
Open source Bee Swarm Simulator macro made for Linux. Supports every DE or WM on Wayland and maybe X11🐧 

</p> 

<p align='center'>
  
  <a href="https://wikipedia.org/wiki/Bash_(Unix_shell)">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white" />
</a>

<a href="https://wikipedia.org/wiki/Linux">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" />
</a>
  
  <a href="https://t.me/+gws61dtKyIRlYzky">
<img src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" />  
</a>

  <a href="https://github.com/painvision/BeeTuxMacro/stargazers">
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/painvision/BeeTuxMacro?style=for-the-badge" />
  </a>

</p>

> [!WARNING]
> If you encounter bugs, open an issue, make a pull request, or join our group on [Telegram](https://t.me/+gws61dtKyIRlYzky). [🇷🇺/🇺🇸]

> 📌 ALERT
> Any DE on Mutter won't work. Macro is working well on pure Wayland DE and compositors

<p align='center'>
<a href="https://github.com/painvision/BeeTuxMacro/blob/main/README_ru.md">
  README.md на русском
</a>
</p>

<h1 align='center'>
Installation
</h1>

### Install dependencies

- Arch-based distros:
```
sudo pacman -S ydotool imagemagick bc xorg-xrandr grim
```
- Debian-based distros:
```
sudo apt install ydotool imagemagick bc xorg-xrandr grim
```
### Open a terminal. Clone this repository:

```
git clone https://github.com/painvision/BeeTuxMacro/
```

<h1 align='center'>
Configuration 
</h1>

There's no GUI (for now)

Edit `~/BeeTuxMacro/config.sh` file using your favourite text editor

<h1 align='center'>
Setup
</h1>

> [!WARNING]
> While macroing, your display scaling option MUST be 100%, Roblox on fullscreen and nothing interrupting it 

You should have ydotoold running in a background, so macro could interact with your keyboard. **You can add it to your autostart because of its 4 MB of RAM usage.** Best way to launch ydotool daemon:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```

Once ydotoold is running, you can start macroing. Toggling macro on/off
```
bash -c ~/BeeTuxMacro/start.sh
```
Find a way to setup keybind with shell command in your WM/DE. 

<h1 align='center'>
Roadmap
</h1>

| Fields              | Features                                  | QoL                                            | Codebase  |
| ------------------- | ----------------------------------------- | ---------------------------------------------- |---------- |
| ✅ Pine Tree Forest | ✅ Auto Dig                               | 📌 GUI for settings instead of notifications   | ❌ Image recognition function (python)
| ✅ Rose Field       | ✅ Auto Sprinkler (can be toggled now)                         | ⏳ Macro releases instead of git repo          | ❌ Image instability function 
| ✅ Pumpkin Field    | ✅ Auto Wealth Clock                      | ❌ Telegram bot hooking                        | ❌ Detect no pollen increase (image instability function)
| ✅ Pineapple Field  | ✅ Auto Gingerbread House                 | ❌ Pause/resume macro                          | ❌ Fixing camera position after reset (recognition function)
| ❌ Stump Field      | ✅ Auto Stockings                         | ❌❌ Claim hive function                       | ❌ Recalculate path walking time OR not walking at all when haste is active (recognition)
| ✅ Strawberry Field | ✅ Auto Honey Wreath                      | ❌ Test all DE/WM                                             | ❌ Auto reconnect (recognition function)
|                     | ✅ Set maximum time to farm if pixel detection fails                    | ❌ Auto reconnect (recognition function)
| ❌ Bamboo Field     | ✅ Walkspeed based calculation for paths  | 📌 Global keybind (no need to manually set it in Settings                                    | ❌ Rewrite walking functions for better code understanding and reading
| ❌ Cactus Field     | ❌ Auto Whirligig                         |                                                |
|                     | ❌ Auto Micro Converter                   |
|                     | ✅ Backpack detection modes (pixel-only/pixel-time/time-only modes) |

| DE/WM | Status |
| ----- | ------ |
| Hyprland | Works flawlessly ✅
| GNOME | Pixel detection don't work ❌
| KDE Plasma (Wayland) | Don't work ❌
| Cinnamon (Wayland)| Pixel detection don't work ❌
| i3 | Works ✅ 
| Sway | Works ✅ 
| Wayfire | Works ✅ 
| Cosmic DE (Wayland) | Works ✅ 

<p align='center'>
If you found macro interesting, consider starring repository. It helps a lot  💞
</p>
