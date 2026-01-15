# 𝐁𝐞𝐞𝐓𝐮𝐱 𝐌𝐚𝐜𝐫𝐨 ☃️
Open source Bee Swarm Simulator macro made for Linux. 🐧
Written with [ydotool](https://github.com/ReimuNotMoe/ydotool), BeeTux supports every DE or WM, X11 or Wayland.

> [!IMPORTANT]
> Macro IS unstable. If you encounter bugs, open an issue, make a pull request, or contact me on [Telegram](https://t.me/NextTimeUsername).

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

I'm not doing Spider/Coconut fields for now.

<sub>Unmade fields placed in priority</sub>

# 𝐅𝐞𝐚𝐭𝐮𝐫𝐞𝐬
- [X] Farm till full backpack and go back to hive
- [X] Convert for time
- [X] Auto sprinkler
- [X] Auto dig
- [X] Walkspeed based calculation for paths
- [X] Auto Gingerbread House
- [X] Auto Stockings
- [X] Advanced logging

Planned:
- [ ] Walking functions rewrite for better code understanding and reading [WORKING]
- [ ] Making full backpack detection work on red shades, not only specific pixel color in /stuff/utils.sh [WORKING]
- [ ] Auto Wealth Clock [WORKING]
- [ ] Auto Snowbear
- [ ] Image recognition function [WORKING]
- [ ] Recalculating time for walk with haste tokens using OCR or image recognition function
- [ ] Instant convertion types (including Honey Wreath) [WORKING]
- [ ] Telegram/Discord hooking


<sub>Placed in priority</sub>

# 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐚𝐭𝐢𝐨𝐧
Install `ydotool slurp imagemagick`  and `grim` (if Wayland) using your package manager.
Open a terminal. Clone this repository:
```
git clone https://github.com/painvision/BeeTuxMacro/
cd BeeTuxMacro/
chmod +x start.sh #enable executing macro
```
> [!TIP]
> Configure ~/BeeTuxMacro/config.sh using your favourite text editor

### In FULL_BACKPACK_PIXEL, put output of `slurp` like this:
<img width="768" height="768" alt="image" src="https://github.com/user-attachments/assets/b5910f15-63d0-4e2d-a5df-b3a7d282eea8" />

> After executing `sleep 2; slurp`, focus on roblox, place your cursor in red space (upper from +pollen text) and move it in right bottom.
> Output of slurp is #,# #x#. copy #,# and paste it in FULL_BACKPACK_PIXEL.

# 𝐒𝐭𝐚𝐫𝐭/𝐬𝐭𝐨𝐩 𝐦𝐚𝐜𝐫𝐨:
You should have ydotoold running in a background so macro could interact as your keyboard. Better way to launch ydotool daemon is:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```
Once ydotoold is running, you can start macroing. Following command is for toggling macro on/off
```
bash -c ~/BeeTuxMacro/start.sh
```
Find a way to setup keybind with bash script in your WM/DE. 
