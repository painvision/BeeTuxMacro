. ~/BeeTuxMacro/config.sh

#DO NOT CHANGE IT!!!!!!!!!!!!!!!!!!!!!
BASE_SPEED=32.2

function note(
echo -e "\\033[30;43m[i] $1\\033[0m"

)

function warning(
echo -e "\\033[35m[!] $1\\033[0m"
)

function success(
echo -e "\\033[32m[✓] $1\\033[0m"
)

function info(
echo -e "\\033[33m[i] $1\\033[0m"
)

function error(
echo -e "\\033[30;41m[X] $1\\033[0m"
)

function check_update_git(
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        return
    fi

    LOCAL_COMMIT=$(git rev-parse HEAD)
    LOCAL_COMMIT_TIME=$(git log -1 --format=%ct)
    LOCAL_COMMIT_DATE=$(git log -1 --format=%ci)

    REMOTE_COMMIT=$(git ls-remote origin HEAD | cut -f1)
    REMOTE_COMMIT_TIME=$(git ls-remote origin HEAD | cut -f1 | xargs git show -s --format=%ct 2>/dev/null || echo "")

    NOW=$(date +%s)
    DIFF=$((NOW - LOCAL_COMMIT_TIME))

    if [ $DIFF -lt 60 ]; then
        AGE="less than a minute ago"
    elif [ $DIFF -lt 3600 ]; then
        AGE="$((DIFF / 60)) minutes ago"
    elif [ $DIFF -lt 86400 ]; then
        AGE="$((DIFF / 3600)) hours ago"
    else
        AGE="$((DIFF / 86400)) days ago"
    fi

    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
        error "Good news! Macro was updated $AGE!"
        error "Use 'git pull' to update"
        notify-send -i ~/BeeTuxMacro/frosty_bee.png "Good news! Macro was updated $AGE! Use 'git pull' to update"
    else
        note "Macro's good to go! Last commit was $AGE. Changelog:"
        curl -l https://raw.githubusercontent.com/painvision/BeeTuxMacro/refs/heads/main/changelog.txt
    fi
)

function avoid_mobs(
for ((i=0; i<$1; i++)); do
jump
sleep 2
done
)

# it was made by deepseek
get_pixel_coords() {
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=955
    local orig_y=38

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
}

FULL_BACKPACK_PIXEL=$(get_pixel_coords)

function pixel_in_red_range() {
    local x=$1
    local r g b
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" - |
            magick png:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    else #idk
        set -- $(
            import -window root -crop 1x1+${x}+${y} txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    fi
    r=$1 g=$2 b=$3
    (( r>=244 && r<=255 &&
       g<=51 &&
       b<=51 ))
}

wait() {
    local base_time="$1"
    local needed_sleep
    needed_sleep=$(bc <<< "scale=4; $base_time * $BASE_SPEED / $WALKSPEED")
    sleep "$needed_sleep"
}


function exit_macro(
bash -c ~/BeeTuxMacro/stuff/close.sh
)

function place_splinker(
down_s
down_a
wait 0.1
up_s
up_a
jump
sleep 0.5
ydotool type $SPRINKLER_SLOT
down_a
wait 0.7
up_a
jump
sleep 0.5
ydotool type $SPRINKLER_SLOT
down_s
wait 0.3
up_s
sleep 0.4
jump
sleep 0.5
ydotool type $SPRINKLER_SLOT
down_d
wait 0.7
up_d
jump
sleep 0.5
ydotool type $SPRINKLER_SLOT
down_w
wait 0.3
up_w
)

function reset (
ydotool key 1:1 1:0 19:1 19:0 28:1 28:0 -d 100
sleep 5
rm ~/BeeTuxMacro/variables/sprinklers_placed
)

function zoom_out(
ydotool key 24:1 24:0
sleep 0.05
)

function auto_dig_on(
ydotool click 0x40
)

function auto_dig_off(
ydotool click 0x80
)

function shift_lock_toggle(
sleep 0.3
ydotool key 42:1 42:0
sleep 0.1
)

function e(
sleep 0.2
ydotool key 18:1 18:0
)

function jump (
ydotool key 57:1 57:0 -d 50
)

function jump_hold (
ydotool key 57:1
)

function jump_release (
ydotool key 57:0
)

function unhold_keys(
ydotool click 0xc0
ydotool key 30:0
ydotool key 31:0
ydotool key 32:0
ydotool key 51:0
ydotool key 52:0
ydotool key 1:0
ydotool key 19:0
ydotool key 28:0
ydotool key 17:0
)

function down_d(
ydotool key 32:1
)

function up_d(
ydotool key 32:0
)


function down_w(
ydotool key 17:1
)

function up_w(
ydotool key 17:0
)

function down_a(
ydotool key 30:1
)

function up_a(
ydotool key 30:0
)

function up_s(
ydotool key 31:0
)

function down_s(
ydotool key 31:1
)


function camera_left(
ydotool key 51:1 51:0
sleep 0.1
)

function camera_right(
ydotool key 52:1 52:0
sleep 0.1
)

function farm_square(
down_a
wait 0.5
up_a
down_s
wait 0.5
up_s
down_d
wait 0.5
up_d
down_w
wait 0.5
up_w
)

function farm_snake(
down_s
wait 0.5
up_s
down_a
wait 0.1
up_a
down_w
wait 0.5
up_w
down_a
wait 0.1
up_a
down_s
wait 0.5
up_s
down_a
wait 0.1
up_a
down_w
wait 0.5
up_w
down_a
wait 0.1
up_a
down_s
wait 0.5
up_s
down_a
wait 0.1
up_a
down_w
wait 0.5
up_w
down_a
wait 0.1
up_a
down_s
wait 0.5
up_s
down_d
wait 0.1
up_d
down_w
wait 0.5
up_w
down_d
wait 0.1
up_d
down_s
wait 0.5
up_s
down_d
wait 0.1
up_d
down_w
wait 0.5
up_w
down_d
wait 0.1
up_d
down_s
wait 0.5
up_s
down_d
wait 0.1
up_d
down_w
wait 0.5
up_w
down_d
wait 0.1
up_d
)
function farm_better_snake(
down_s
wait 0.3
up_s
down_a
wait 0.1
up_a
down_w
wait 0.3
up_w
down_a
wait 0.1
up_a
down_s
wait 0.3
up_s
down_a
wait 0.1
up_a
down_w
wait 0.3
up_w
down_a
wait 0.1
up_a
down_s
wait 0.3
up_s
down_a
wait 0.1
up_a
down_w
wait 0.3
up_w
down_a
wait 0.1
up_a
down_s
wait 0.3
up_s
down_a
wait 0.1
up_a
down_w
wait 0.3
up_w
down_d
wait 0.83
up_d
)
