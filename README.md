> [!IMPORTANT]
> If you found macro interesting, consider starring repository. It means a lot for me 

<h1 align='center'>
BeeTux Macro ☃️
</h1>

Open source Bee Swarm Simulator macro made for Linux. 🐧
Written with bash and [ydotool](https://github.com/ReimuNotMoe/ydotool), BeeTux supports every DE or WM, Wayland and maybe X11

> [!WARNING]
> Macro is not stable. If you encounter bugs, open an issue, make a pull request, or contact me on [Telegram](https://t.me/NextTimeUsername).

# Installation

Install `ydotool imagemagick bc xorg-xrandr`  and `grim` (if Wayland) using your package manager.
Open a terminal. Clone this repository:

```
git clone https://github.com/painvision/BeeTuxMacro/
cd BeeTuxMacro/
```

# Configuration 
Edit file `~/BeeTuxMacro/config.sh` using your favourite text editor

# Setup
You should have ydotoold running in a background, so macro could interact with your keyboard. Best way to launch ydotool daemon is by running this command:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```
> [!TIP]
> You can add it to your autostart because of its 4 MB of RAM usage

Once ydotoold is running, you can start macroing. Following command is for toggling macro on/off
```
bash -c ~/BeeTuxMacro/start.sh
```
Find a way to setup keybind with bash script in your WM/DE. 

# Fields

- [X] Pine Tree Forest
- [X] Rose Field
- [X] Pumpkin Field
- [X] Pineapple Field

Planned:

- [ ] Stump Field
- [ ] Strawberry Field
- [ ] Bamboo Field
- [ ] Cactus Field

# Features
- [X] Farm till full backpack and go back to hive
- [X] Convert for time
- [X] Auto sprinkler
- [X] Auto dig
- [X] Walkspeed based calculation for paths
- [X] Auto Wealth Clock
- [X] Auto Gingerbread House
- [X] Auto Stockings 
- [X] Advanced logging
- [X] Honey Wreath for converting


# TO DO

### Stability:
- [ ] Image recognition function (should use python for that)
- [ ] Image instability function (calculate how much picture 1 different from picture 2)
- [ ] Detect no pollen increase using image instability function
- [ ] Set right camera position after reset with image recognition function
- [ ] Recalculate path walking time OR not walking at all when haste exists using image recognition function
- [ ] Auto reconnect with image recognition function and claim hive function
- [X] Full backpack detection on red shades, not only specific pixel color in /stuff/utils.sh
- [X] Replace sprinklers after player reset (variables/sprinklers_set)

### Optimization:

- [X] Remake from_hive_to_pine_tree_with_red_cannon with glider
- [X] Optimize climbing to red cannon
- [X] Full backpack detection repeat itself while farming, not when done farm pattern (separate check.sh)

### Codebase:

- [ ] Rewrite walking functions for better code understanding and reading
> from "down_s; wait 0.5; down_d; wait 0.5; up_d up_s"
> to "walk_s 0.5; walk_sd 0.5"
- [X] Split start.sh in pre_farm.sh, farm.sh and after_farm.sh
- [X] Get rid of screenshots and logging

### QoL:
- [X] No need to manually configure full backpack pixel
- [ ] Pause/resume macro with toggle.sh or second start.sh call
- [ ] Graphical user interface for settings
- [ ] Telegram bot hooking (like restarting macro, get current screenshot, honey monitoring)
- [ ] Claim hive function with image recognition function

### Features:
- [ ] Whirligig (Need image recognition function)
- [ ] Micro Converter (Need image recognition function)

How many times i said "image recognition function"?
