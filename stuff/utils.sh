. ~/BeeTuxMacro/config.sh

# Macros are made initially for that walkspeed
BASE_SPEED=32.2

function pixel_in_red_range() {
    local x=$1
    local r g b

    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        set -- $(
            grim -g "${1} 1x1" - |
            convert png:- txt:- |
            sed -n 's/.*srgb(\([0-9]*\),\([0-9]*\),\([0-9]*\)).*/\1 \2 \3/p'
        )
    else
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

    [[ -z "$BASE_SPEED" || -z "$WALKSPEED" ]] && {
        echo "BASE_SPEED or WALKSPEED is not set"
        return 1
    }

    (( WALKSPEED == 0 )) && {
        echo "WALKSPEED cannot be 0"
        return 1
    }

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
)

function zoom_out(
ydotool key 24:1 24:0
sleep 0.05
)

function auto_dig_on(
ydotool click 0x40
)

function screenshot(
if [ "$SCREENSHOTS" -eq 1 ]; then
    grim ~/BeeTuxMacro/log/$1-$(date +"%H-%M-%S_%d-%m-%Y").png
fi
)


function auto_dig_off(
ydotool click 0x80
)

function shift_lock_toggle(
ydotool key 42:1 42:0
sleep 0.1
)

function e(
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
ydotool click 0x80
ydotool key 30:0 31:0 32:0 51:0 52:0 1:0 19:0 28:0 17:0
sleep 0.1
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
