. ~/BeeTuxMacro/config.sh
function place_splinker(
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
jump
sleep 0.4
ydotool type $SPRINKLER_SLOT
sleep 1.5
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
sleep 0.500000
up_a
down_s
sleep 0.500000
up_s
down_d
sleep 0.5
up_d
down_w
sleep 0.5
up_w
)

function farm_snake(
down_s
sleep 0.5
up_s

down_a
sleep 0.1
up_a

down_w
sleep 0.5
up_w

down_a
sleep 0.1
up_a

down_s
sleep 0.5
up_s

down_a
sleep 0.1
up_a

down_w
sleep 0.5
up_w

down_a
sleep 0.1
up_a

down_s
sleep 0.5
up_s

down_a
sleep 0.1
up_a

down_w
sleep 0.5
up_w

down_a
sleep 0.1
up_a

down_s
sleep 0.5
up_s

down_d
sleep 0.1
up_d

down_w
sleep 0.5
up_w

down_d
sleep 0.1
up_d

down_s
sleep 0.5
up_s

down_d
sleep 0.1
up_d

down_w
sleep 0.5
up_w

down_d
sleep 0.1
up_d

down_s
sleep 0.5
up_s

down_d
sleep 0.1
up_d

down_w
sleep 0.5
up_w
down_d
sleep 0.1
up_d
)
