export MACRO_DIR=$(cd $(dirname "$BASH_SOURCE[0]") && cd .. && pwd)

. $MACRO_DIR/config.sh
if [ ! -d "$MACRO_DIR/variables/" ]; then
    mkdir $MACRO_DIR/variables/
fi

BASE_SPEED=32.2

function convert(

current_time=$(date +%s)
honey_wreath_threshold=$((current_time - 1800))

sleep 0.4

if [[ $AUTO_WREATH == 1 ]]; then
    if [ "$(cat $MACRO_DIR/variables/should_wreath)" -lt "$honey_wreath_threshold" ]; then
        from_hive_to_honey_wreath_and_back
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            down_s
            wait 0.14
            up_s
            down_a
            wait 6
            up_a
            re_go_to_hive_slot
            e
            sleep $CONVERT_TIME
        else
            date +%s > $MACRO_DIR/variables/should_wreath
            reset
            down_w
            wait 4
            up_w
        fi
    fi
else
    e
    sleep 1

    if [[ $BACKPACK_DETECTION_MODE == 2 || -f $MACRO_DIR/variables/cant_use_pixel_detection ]]; then
        sleep $CONVERT_TIME
        rm $MACRO_DIR/variables/time_exceed
        return 0
    fi

    if [[ $BACKPACK_DETECTION_MODE == 0 ]]; then
    sleep $CONVERT_TIME
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            re_go_to_hive_slot
            e
            sleep $CONVERT_TIME
        fi
    fi

    if [[ $BACKPACK_DETECTION_MODE == 1 ]]; then
        if [ -f $MACRO_DIR/variables/time_exceed ]; then
            sleep $CONVERT_TIME
            rm $MACRO_DIR/variables/time_exceed
        else
            sleep $CONVERT_TIME
            if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
                re_go_to_hive_slot
                e
                sleep $CONVERT_TIME
            fi
        fi
    fi
fi
)

function re_go_to_hive_slot(
    down_wd
    wait 4
    up_wd
    down_a
    wait 0.1
    up_a
    down_s
    wait 0.6
    up_s
    down_d
    wait 6.6
    up_d
    down_s
    wait 0.1
    up_s
    if [ ! -f $MACRO_DIR/variables/cant_use_pixel_detection ]; then
        from_corner_to_hive_no_pixel_detection $(cat $MACRO_DIR/variables/hive_slot)
    else
        from_corner_to_hive $(cat $MACRO_DIR/variables/hive_slot)
    fi
)

function find_hive(
    while :
    do
    reset
    down_w
    wait 4
    up_w
    sleep 0.1 # ДИСЦИПЛИНА ✅✅✅ ДМИИИИИИИИИТРИЙ
    down_s
    wait 0.2
    up_s
    down_d
    wait 6.6
    up_d
    down_s
    wait 0.2
    up_s
    down_a
    wait 0.5
    up_a
    camera_left
    camera_left
    shift_lock_toggle
    shift_lock_toggle
    for ((i=0; i<5; i++)); do
    if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
        camera_right
        camera_right
        if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
            camera_left
            camera_left
            jump
            sleep 0.53
            jump
            sleep 0.9
        else
            camera_left
            camera_left
            jump
            sleep 0.53
            jump
            sleep 0.9
        fi
    else
    if pixel_is_white $(get_claim_hive_c_coords) || pixel_is_white $(get_make_honey_h_coords); then
        e
        camera_right
        camera_right
        shift_lock_toggle
        shift_lock_toggle
        echo $(echo 5-$i | bc) > $MACRO_DIR/variables/hive_slot
        notify-send $(cat $MACRO_DIR/variables/hive_slot)
        return 0
    else
        jump
        sleep 0.53
        jump
        sleep 0.9
    fi
    fi
    done
    reset
    if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
        find_hive
    else
        if pixel_is_white $(get_claim_hive_c_coords) || pixel_is_white $(get_make_honey_h_coords); then
            true
            return 0
        else
            find_hive
        fi
    fi
    done
)

function go_to_field(
    if [[ $FIELD = "pine" ]]; then
        from_hive_to_pine_tree_with_red_cannon
    fi
    if [[ $FIELD = "rose" ]]; then
        echo rose
        from_hive_to_rose_field
    fi
    if [[ $FIELD = "pumpkin" ]]; then
        from_hive_to_pumpkin_with_red_cannon
    fi
    if [[ $FIELD = "pineapple" ]]; then
        from_hive_to_pineapple_with_red_cannon
    fi
    if [[ $FIELD = "strawberry" ]]; then
        from_hive_to_strawberry_with_red_cannon
    fi
)

function back_to_hive(
    if [[ $FIELD = "pine" ]]; then
        from_pine_tree_to_hive
    fi
    if [[ $FIELD = "rose" ]]; then
        echo rose
        from_rose_field_to_hive
    fi
    if [[ $FIELD = "pumpkin" ]]; then
        from_pumpkin_to_hive
    fi
    if [[ $FIELD = "pineapple" ]]; then
        from_pineapple_to_hive
    fi
    if [[ $FIELD = "strawberry" ]]; then
        from_strawberry_to_hive
    fi
)

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

function check_update_git( #that was vibe coded :P
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
        error "Use 'git pull' to update. Changelog:"
        curl -l https://raw.githubusercontent.com/painvision/BeeTuxMacro/refs/heads/main/changelog.txt
        notify-send -i $MACRO_DIR/frosty_bee.png "BeeTux Macro ☃️" "Good news! Macro was updated $AGE! Use 'git pull' to update"
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
# to make honey, collect...
# that message when backpack is empty and ur near
# your hive

function get_to_make_honey_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=701
    local orig_y=78

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)
function move_mouse_on_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=$1
    local orig_y=$2

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)

    wlrctl pointer move -10000 -10000
    sleep 0.1
    wlrctl pointer move $new_x $new_y
)
function get_reconnect_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1280
    local orig_height=720
    local orig_x=750
    local orig_y=379

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)

# it was made by deepseek
function get_full_backpack_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=953
    local orig_y=28

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)

# it was made by deepseek
function get_claim_hive_c_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=638
    local orig_y=81

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)


# it was made by deepseek
function get_make_honey_h_coords(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=719
    local orig_y=88

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)
function get_coords_to_check_disabled_trade_requests(
    local resolution
    resolution=$(xrandr | grep "*")

    local width height
    width=$(echo "$resolution" | awk '{print $1}' | cut -dx -f1)
    height=$(echo "$resolution" | awk '{print $1}' | cut -dx -f2)

    local orig_width=1366
    local orig_height=768
    local orig_x=819
    local orig_y=101

    local new_x new_y

    new_x=$(echo "scale=0; $orig_x * $width / $orig_width" | bc)
    new_y=$(echo "scale=0; $orig_y * $height / $orig_height" | bc)
    echo "${new_x},${new_y}"
)


function pixel_is_white(
    local x=$1
    local r g b
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" -t ppm - |
            magick ppm:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p' & sleep 0.3; pkill grim
        )
    else
        set -- $(
            import -window root -crop 1x1+${x}+${y} txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    fi
    r=$1 g=$2 b=$3
    (( r>=234 &&
       g>=234 &&
       b>=234 ))
)

function pixel_is_reconnect_color(
    local x=$1
    local r g b
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" -t ppm - |
            magick ppm:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p' & sleep 0.3; pkill grim
        )
    else
        set -- $(
            import -window root -crop 1x1+${x}+${y} txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    fi
    r=$1 g=$2 b=$3
    (( r==60 &&
       g==61 &&
       b==63 ))
)

function pixel_in_trade_disabled_range(
    local x=$1
    local r g b
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" -t ppm - |
            magick ppm:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p' & sleep 0.3; pkill grim
        )
    else
        set -- $(
            import -window root -crop 1x1+${x}+${y} txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    fi
    r=$1 g=$2 b=$3
    echo $r $g $b
    (( r>=170 && r<=255 &&
       g<=92 &&
       b<=90 ))
)

function pixel_in_red_range(
    local x=$1
    local r g b
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" -t ppm - |
            magick ppm:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p' & sleep 0.3; pkill grim
        )
    else
        set -- $(
            import -window root -crop 1x1+${x}+${y} txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    fi
    r=$1 g=$2 b=$3
    (( r>=200 && r<=255 &&
       g<=51 &&
       b<=51 ))
)

function wait(
    local base_time="$1"
    local needed_sleep
    needed_sleep=$(bc <<< "scale=4; $base_time * $BASE_SPEED / $WALKSPEED")
    sleep "$needed_sleep"
)


function exit_macro(
bash -c $MACRO_DIR/stuff/close.sh
)

function place_splinker(
down_sa
wait 0.1
up_sa
jump
sleep 0.5
wtype $SPRINKLER_SLOT
down_a
wait 0.7
up_a
jump
sleep 0.5
wtype $SPRINKLER_SLOT
down_s
wait 0.3
up_s
sleep 0.4
jump
sleep 0.5
wtype $SPRINKLER_SLOT
down_d
wait 0.7
up_d
jump
sleep 0.5
wtype $SPRINKLER_SLOT
down_w
wait 0.3
up_w
)

function reset (
wtype -P Escape -s 40 -p Escape
sleep 0.2
wtype -P R -s 40 -p R
sleep 0.2
wtype -P Return -s 40 -p Return
sleep 7.5
rm $MACRO_DIR/variables/sprinklers_placed
)

function zoom_out(
wtype -P O -p O
sleep 0.05
)

function lmb_click(
wlrctl pointer click left
)

function rmb_click(
wlrctl pointer click right
)

function shift_lock_toggle(
sleep 0.3
wtype -P Shift_L -s 40 -p Shift_L
sleep 0.1
)

function e(
sleep 0.2
wtype -P E -p E
)

function jump (
wtype -P space -s 40 -p space
)

function jump_hold (
wtype -P space
)

function jump_release (
wtype -p space
)

function unhold_keys(
wlrctl pointer click
wtype -p W -p A -p S -p D -p space -p Escape -p Return -p E
)

function down_d(
wtype -P D
)

function up_d(
wtype -p D
)


function down_w(
wtype -P W
)

function up_w(
wtype -p W
)

function down_a(
wtype -P A
)

function up_a(
wtype -p A
)
function down_s(
wtype -P S
)

function up_s(
wtype -p S
)

function down_wd(
wtype -P W -P D
)

function up_wd(
wtype -p W -p D
)

function down_wa(
wtype -P W -P A
)

function up_wa(
wtype -p W -p A
)

function down_sd(
wtype -P S -P D
)

function up_sd(
wtype -p S -p D
)

function down_sa(
wtype -P S -P A
)

function up_sa(
wtype -p S -p A
)

function down_aw(
down_wa
)

function up_aw(
up_wa
)

function down_dw(
down_wd
)
function up_dw(
up_wd
)
function down_ds(
down_sd
)
function up_ds(
up_sd
)
function down_as(
down_sa
)
function up_as(
up_sa
)

function camera_left(
wtype -P comma -s 40 -p comma
sleep 0.1
)

function camera_right(
wtype -P period -s 40 -p period
sleep 0.1
)

function camera_up(
wtype -P Prior -s 40 -p Prior
)

function camera_down(
wtype -P Next -s 40 -p Next
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
wait 0.29
up_s
down_a
wait 0.1
up_a
down_w
wait 0.29
up_w
down_a
wait 0.1
up_a
down_s
wait 0.29
up_s
down_a
wait 0.1
up_a
down_w
wait 0.29
up_w
down_a
wait 0.1
up_a
down_s
wait 0.29
up_s
down_a
wait 0.1
up_a
down_w
wait 0.29
up_w
down_a
wait 0.1
up_a
down_s
wait 0.29
up_s
down_a
wait 0.1
up_a
down_w
wait 0.29
up_w
down_d
wait 0.845
up_d
)
