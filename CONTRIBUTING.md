# Everyone can contribute!

If macro is failing to do something, feel free to [tell about the issue on Github](https://github.com/painvision/BeeTuxMacro/issues), [Discord](https://discord.gg/pAUUYbPqs6) or [Telegram group](https://t.me/+gws61dtKyIRlYzky). 

Если что, я русскоязычный :)

# How BeeTux works
It is just a bunch of ydotool commands, wrapped in a bunch of functions.

For example, you can create some simple farm pattern

Open `paths.sh`

To create farm function:

```
function farm_pattern_name(
    ... there goes
    ... your
    ... commands
)
```

There are some basic commands, to control our player, or do something

| Command | What it does
| ------- | -------------
| e       | Press `e`
| jump    | Press `Space` key
| down_w | Press `w` key
| up_w | Release `w` key
| down_a | Press `a` key
| up_a | Release `a` key
| down_s | Press `s` key
| up_s | Release `s` key
| down_d | Press `d` key
| up_d | Release `d` key
| camera_right | Turns camera right 45 degress (presses `>`)
| camera_left | Turns camera left 45 degress (presses `<`)
| wait `INT` | Waits for `INT` seconds. Adapts for WALKSPEED, used only in walking functions
| sleep `INT` | Sleeps for `INT` seconds
| shift_lock_toggle | Toggles shift lock
| unhold_keys | Unholds all keys in case when some key is still holded

Knowing some basic commands, you can create your farm pattern!

```
function farm_conributing(
    
    down_a # This command holds 'a' key
    wait 1 # Waits approximately 1 seconds
    up_a # Then releases it

    # Same for 's' key
    down_s
    wait 1
    up_s
    
    # Same for 'd' key
    down_d
    wait 1
    up_d
    
    # And for 'w' key, returning to the starting point
    down_w
    wait 1
    up_w
    
)
```
If you start this function, your player should move in a square pattern.

Once you saved this function in paths.sh, you can test it by yourself!

Open test.sh. It should look like this

```
#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

unhold_keys

if [ ! -e lockfiletest ]; then
    touch lockfiletest
    # here you want to add your pattern for testing 👇

    farm_conributing

    rm lockfiletest
else
    unhold_keys
    rm lockfiletest
    exit_macro
fi
```

Now, you can launch bash script via keybind, and test your farm pattern. If it works well, you can make a pull request of it, use it in config.sh and farm using your own pattern!

Same logic applies for paths. It's just a bunch of walk commands. There are some premade commands for specific things. Like

`from_hive_to_red_cannon` - properly go to red cannon (but not launching it)
`reset` - properly reset character
`place_sprinkler` - properly set sprinklers

There are more of them. Just look in utils.sh, im too lazy to describe each one of them =)
