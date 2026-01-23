hello
> [!IMPORTANT]
> If you found macro interesting, consider starring repository. It means a lot to me 

# BeeTux Macro ☃️
Open source Bee Swarm Simulator macro made for Linux. 🐧
Written with [ydotool](https://github.com/ReimuNotMoe/ydotool), BeeTux supports every DE or WM, Wayland and maybe X11

> [!WARNING]
> Macro is not stable. If you encounter bugs, open an issue, make a pull request, or contact me on [Telegram](https://t.me/NextTimeUsername).

# Installation

Install `ydotool slurp imagemagick bc`  and `grim` (if Wayland) using your package manager.
Open a terminal. Clone this repository:

```
git clone https://github.com/painvision/BeeTuxMacro/
cd BeeTuxMacro/
```

# Configuration 
Edit file `~/BeeTuxMacro/config.sh` using your favourite text editor

In FULL_BACKPACK_PIXEL, put output of `slurp` like this:
<img width="768" height="768" alt="image" src="https://github.com/user-attachments/assets/b5910f15-63d0-4e2d-a5df-b3a7d282eea8" />

> After executing `sleep 2; slurp`, focus on roblox, place your cursor like on screenshot (upper from +pollen text) and move it in right bottom.
> Output of slurp is #,# #x#. copy #,# and paste it in FULL_BACKPACK_PIXEL.
> Soon this complex setup won't exist

# Macro setup:
You should have ydotoold running in a background so macro could interact as your keyboard. Better way to launch ydotool daemon is:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```
You can add it to your autostart, as its very lightweight 

Once ydotoold is running, you can start macroing. Following command is for toggling macro on/off
```
chmod +x start.sh #enable executing macro
```
```
bash -c ~/BeeTuxMacro/start.sh
```
Find a way to setup keybind with bash script in your WM/DE. 

# Fields

- [X] Pine Tree Forest
- [X] Rose Field
- [X] Pumpkin Field

Planned:

- [ ] Pineapple Field
- [ ] Stump Field
- [ ] Strawberry Field
- [ ] Bamboo Field
- [ ] Cactus Field

# 𝐅𝐞𝐚𝐭𝐮𝐫𝐞𝐬
- [X] Farm till full backpack and go back to hive
- [X] Convert for time
- [X] Auto sprinkler
- [X] Auto dig
- [X] Walkspeed based calculation for paths
- [X] Auto Gingerbread House
- [X] Auto Stockings 
- [X] Advanced logging

# TO DO

### Stability:
- [X] Full backpack detection on red shades, not only specific pixel color in /stuff/utils.sh
- [ ] Replace sprinklers after player reset (variables/sprinklers_set)
- [ ] Image recognition function (should use python for that)
- [ ] Image instability function (calculate how much picture 1 different from picture 2)
- [ ] Detect no pollen increase using image instability function
- [ ] Set right camera position after reset with image recognition function
- [ ] Recalculate path walking time OR not walking at all when haste exists using image recognition function
- [ ] Auto reconnect with image recognition function and claim hive function

### Optimization:

- [ ] Remake from_hive_to_pine_tree_with_red_cannon with glider
- [ ] Optimize from_pine_tree_to_hive with glider
- [ ] Optimize climbing to red cannon

currently juiced 2 seconds ._.

- [X] Full backpack detection repeat itself while farming, not when done farm pattern (separate check.sh)

### Codebase:

- [ ] Rewrite walking functions for better code understanding and reading
> from "down_s; wait 0.5; down_d; wait 0.5; up_d up_s"
> to "walk_s 0.5; walk_sd 0.5"
- [X] Split start.sh in pre_farm.sh, farm.sh and after_farm.sh
- [ ] Get rid of screenshots and logging

### QoL:
- [X] No need to manually configure full backpack pixel
- [ ] Pause/resume macro with toggle.sh or second start.sh call
- [ ] Graphical user interface for settings
- [ ] Telegram bot hooking (like restarting macro, get current screenshot, honey monitoring)
- [ ] Claim hive function with image recognition function

### Features:
- [X] Auto Wealth Clock
- [X] Honey Wreath for converting
- [ ] Whirligig (Need image recognition function)
- [ ] Micro Converter (Need image recognition function)

How many times i said "image recognition function"?
