# BeeTux Macro ☃️
Open source Bee Swarm Simulator macro made for Linux. 🐧

Written with [ydotool](https://github.com/ReimuNotMoe/ydotool) and bash, BeeTux supports every DE or WM, X11 or Wayland.

> [!IMPORTANT]
> Macro IS unstable. If you encounter bugs, open an issue, make a pull request, or contact me on [Telegram](https://t.me/NextTimeUsername).

# Features
- [X] Farm till full backpack
- [X] Farming for time
- [X] Convert till backpack empty
- [X] Auto sprinkler
- [X] Auto dig
- [X] Walkspeed based calculation for paths
- [X] 2 paths for Pine Tree Forest
- [X] Path for Rose Field
- [X] Advanced logging

Planned:
- [ ] Auto Gingerbread House
- [ ] Auto Wealth Clock
- [ ] More fields
- [ ] Auto Stockings
- [ ] Auto Snowbear
- [ ] Instant convertion types (including Honey Wreath)
- [ ] Telegram/Discord hooking

<sub>Placed in priority</sub>

# Installation
Install `ydotool` and `tesseract` using your package manager.
Open a terminal. Clone this repository:
```
git clone https://github.com/painvision/BeeTuxMacro/
cd BeeTuxMacro/
chmod +x start.sh #enable executing macro
```
Configure your macro with your text editor: `~/BeeTuxMacro/config.sh`
### In WALKSPEED, enter your walkspeed
### In BACKPACK_COORDS, put output of `slurp` like this:
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/38d9bbb0-7523-438a-ba71-bb96f6acf766" />

> so you can use convert on percent feature

## Start/stop macro:
```
bash -c ~/BeeTuxMacro/start.sh
```
Find a way to setup keybind for bash script in your WM/DE. 
