<p align='center'>
<img width="300" height="230" alt="image" src="https://github.com/painvision/BeeTuxMacro/blob/main/frosty_bee.png">
</p>
<h1 align='center'>
BeeTux Macro ☃️
</h1>

<p align='center'>
Open source Bee Swarm Simulator macro made for Linux. Supports every DE or WM on Wayland and maybe X11🐧 
</p> 

<p align='center'>

<a href="https://wikipedia.org/wiki/Linux">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" />
</a>

 <a href="https://discord.gg/pAUUYbPqs6">
<img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=Discord&logoColor=white" />  
</a>

  <a href="https://t.me/+gws61dtKyIRlYzky">
<img src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" />  
  </a>

</p>

> [!WARNING]
> If you encounter bugs, open an issue, make a pull request, join our [discord chat](https://discord.gg/pAUUYbPqs6), or group on [Telegram](https://t.me/+gws61dtKyIRlYzky). [🇷🇺/🇺🇸]

> [!TIP]
> 📌 Any DE on Mutter won't work. Macro is working well on PURE Wayland and X11 desktop environments and window managers

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
If there are some updates, you can update macro by running this command in macro's directory:

```
git pull
```

### Configuration

Edit `~/BeeTuxMacro/config.sh` file using your favourite text editor. No GUI, the Linux way to macro

<h1 align='center'>
Setup
</h1>

> [!WARNING]
> While macroing, your display scaling option MUST be 100%, Roblox on fullscreen and nothing interrupting it 

You should have ydotoold running in a background, so macro could interact with your keyboard. **You can add it to your autostart because of its 4 MB of RAM usage.** Best way to launch ydotool daemon:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```

Once ydotoold is running, you can start macroing. 

Toggling macro on/off

| Command                              | What it does
| ------------------------------------ | ------------
| bash -c ~/BeeTuxMacro/start.sh       | Toggles macro
| bash -c ~/BeeTuxMacro/stuff/close.sh | Force closes macro

Find a way to setup keybind with shell command in your WM/DE. 

<h1 align='center'>
Roadmap
</h1>

#### Fields:
- ✅ Pine Tree Forest
- ✅ Rose Field
- ✅ Pumpkin Field
- ✅ Pineapple Field
- ✅ Strawberry Field

> Planned: ❌ Stump, ❌ Cactus and ❌ Bamboo

#### Features:
- ✅ Auto Dig
- ✅ Auto Sprinkler
- ✅ Auto Wealth Clock
- ✅ Auto Stockings
- ✅ Auto Honey Wreath
- ✅ Convert when full backpack
- ✅ Convert when time exceeded
- ✅ Auto Kill Mobs
- ✅ Auto Claim Hive (optional manual selection)

> Planned: ❌ Auto Micro Converter, ❌ Auto Whirligig

#### TO DO
- 📌 GUI for hive selection/toggle macro instead of notifications
- ✅ Auto Reconnect
- ❌ Telegram bot hooking
- ❌ Image recognition function
- ❌ Image instability function
- ❌ Detect no pollen increase with instability function
- ❌ Fixing camera position after reset
- ❌ Recalculate path walking time OR not walking at all when haste is active
- ✅ Optimize checking pixel's by precalculating pixel coords, not calculating them at each cycle (function at the start OR variable in files) - applied on check_inventory, this precalculation on auto hive not necessary
- ✅ Merged stockings and wealth clock functions, so it would take less time
