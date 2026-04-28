<p align='center'>
<img width="300" height="230" alt="image" src="https://github.com/painvision/BeeTuxMacro/blob/main/frosty_bee.png">
</p>
<h1 align='center'>
BeeTux Macro ☃️
</h1>

<p align='center'>
Open source Bee Swarm Simulator macro made for Linux. Supports every DE or WM, Wayland and X11🐧 
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
> If you encounter bugs, open an issue, make a pull request, join our [discord chat](https://discord.gg/pAUUYbPqs6), or [group on Telegram](https://t.me/+gws61dtKyIRlYzky). [🇷🇺/🇺🇸]

> [!TIP]
> 📌 Macro works on any distros DE's and WM's, but only Wayland compositors support pixel detection. If your DE/WM supports `grim` screenshot utility, you will get the most of the macro

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

Edit `~/BeeTuxMacro/config.sh` file using your favourite text editor. No GUI, the Linux way to configure your macro

<h1 align='center'>
Setup
</h1>

Run `~/BeeTuxMacro/setup.sh`


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

> [!WARNING]
> Your display scaling option MUST be 100%, Roblox on fullscreen and nothing interrupting macro to work

<h1 align='center'>
Roadmap
</h1>


#### Features:
- ✅ Auto Claim Hive (optional manual selection)
- ✅ Auto Sprinkler
- ✅ Auto Dig
- ✅ Convert when full backpack
- ✅ Convert when time exceeded
- ✅ Auto Honey Wreath
- ✅ Auto Kill Mobs
- ✅ Auto Wealth Clock
- ✅ Auto Stockings
- ✅ Auto Find Hive
- ✅ Auto Red/White/Blue boosters
- ✅ Gather Interrupt for individual dispenser
- ✅ Auto Reconnect

> Planned: ❌ Planters, ❌ More dispensers

#### Fields:
- ✅ Pine Tree Forest
- ✅ Rose Field
- ✅ Pumpkin Field
- ✅ Pineapple Field
- ✅ Strawberry Field

> Planned: ❌ More fields

#### TO DO
- 🗿📌 GUI for hive selection/toggle macro instead of notifications
- 📌❌ Telegram bot hooking
- ❌ Image recognition function
- ❌ Image instability function
