> [!IMPORTANT]
> If you found macro interesting, consider starring repository. It means a lot to me 

# 𝐁𝐞𝐞𝐓𝐮𝐱 𝐌𝐚𝐜𝐫𝐨 ☃️
Open source Bee Swarm Simulator macro made for Linux. 🐧
Written with [ydotool](https://github.com/ReimuNotMoe/ydotool), BeeTux supports every DE or WM, (hopefully) X11 or Wayland.

> [!WARNING]
> Macro is not stable. If you encounter bugs, open an issue, make a pull request, or contact me on [Telegram](https://t.me/NextTimeUsername).

# 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐚𝐭𝐢𝐨𝐧

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

# 𝐒𝐭𝐚𝐫𝐭/𝐬𝐭𝐨𝐩 𝐦𝐚𝐜𝐫𝐨:
You should have ydotoold running in a background so macro could interact as your keyboard. Better way to launch ydotool daemon is:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```
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

### Optimization:

- [ ] Optimize all paths
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

### Features:
- [ ] Auto Wealth Clock
- [ ] Auto Snowbear (idk)
- [ ] Instant convertion types (including Honey Wreath)
