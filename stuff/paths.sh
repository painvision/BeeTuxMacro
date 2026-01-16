function from_hive_to_stockings_and_back (
jump_release
down_w
wait 1
up_w
down_d
wait 8
up_d
down_s
down_a
wait 4.35
up_s
up_a
down_a
jump_hold
wait 13
jump_release
wait 3
up_a
down_d
wait 2.25
up_d
e
down_a
wait 1
up_a
down_d
wait 3
up_d
reset
)
function from_hive_to_gingerbread_house_and_back(
down_w
wait 1
up_w
down_d
wait 8
up_d
down_s
wait 2.3
jump
wait 9
up_s
down_w
wait 0.75
up_w
e
sleep 3;
reset
)
function from_pumpkin_to_hive(
down_a
down_s
wait 4
up_a
up_s
down_w
wait 5
up_w
down_d
wait 0.5
up_d
down_w
down_a
wait 1
up_a
wait 3
down_a
jump
wait 0.3
up_a
wait 12
up_w
down_a
down_s
wait 0.2
up_s
wait 8.7
up_a
down_w
wait 1
up_w
down_a
wait 1
up_a
)

function from_hive_to_pumpkin_with_red_cannon(
down_w
wait 3
up_w
down_d
wait 8
up_d
down_a
wait 0.2
up_a
sleep 0.1
down_s
wait 0.05
up_s
jump
sleep 0.1
down_d
wait 1
up_d
down_w
wait 0.45
up_w
down_d
down_s
wait 0.2
up_s
sleep 0.3
up_d
wait 1
e
down_d
down_s
wait 1.3
up_s
wait 5
jump
sleep 1
jump
sleep 1
jump
wait 5
up_d
down_w
wait 0.4
up_w
)
function from_hive_to_pine_tree_with_red_cannon(
down_w
wait 1
up_w
down_d
wait 8
up_d
down_a
wait 0.2
up_a
sleep 0.1
down_s
wait 0.05
up_s
jump
sleep 0.1
down_d
wait 1
up_d
down_w
wait 0.45
up_w
down_d
down_s
wait 0.2
up_s
sleep 0.45
up_d
wait 1
e
down_d
down_s
wait 1.3
up_s
wait 5
jump
sleep 1
jump
sleep 1
jump
wait 13
up_d
camera_right
camera_right
down_s
down_a
wait 0.6
up_s
up_a
)
function from_rose_field_to_hive(
down_w
down_d
wait 3
up_d
down_a
wait 6
jump
jump
wait 14
up_a
sleep 0.1
up_w
down_s
wait 0.6
up_s
down_a
wait 8
up_a
down_w
wait 2
up_w
down_a
wait 2
up_a
)

#25,4 seconds
function from_hive_to_rose_field(
down_w
wait 3
up_w
down_s
wait 0.2
up_s
down_d
wait 8
up_d
sleep 0.1
down_a
wait 0.05
up_a
sleep 0.2
jump
down_d
wait 1
up_d
down_s
wait 3.5
down_d
wait 2
up_s
down_a
wait 0.05
up_a
sleep 0.2
jump
sleep 0.5
down_s
wait 6
up_d
up_s
down_w
wait 2
up_w
down_s
down_a
wait 1
up_a
sleep 0.5
up_s
)

function from_pine_tree_to_hive(
camera_left
sleep 0.2
camera_left
down_d
wait 1.5
up_d
down_s
wait 5
up_s
down_a
wait 12
up_a
down_w
wait 6
jump
down_w
wait 8
up_w
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
jump
sleep 0.5275
jump
sleep 1
camera_left
camera_left
down_w
wait 6
up_w
down_s
wait 0.15
up_s
down_a
wait 3
down_w
wait 0.10
up_w
wait 2.85
up_a
down_w
wait 1
up_w
down_a
wait 1
up_a
)

function from_hive_to_pine_tree(
down_w
wait 1
up_w
down_d
wait 8
up_d
sleep 0.1
down_a
wait 0.05
up_a
sleep 0.2
jump
down_d
wait 1
up_d
down_s
wait 3.5
down_d
wait 2
up_s
down_a
wait 0.05
up_a
sleep 0.2
up_d
sleep 0.4
down_a
wait 0.2
up_a
down_d
jump
sleep 0.4
down_s
wait 6
up_d
down_a
wait 3
up_a
sleep 1
down_d
wait 0.5
up_d
wait 10
up_s
down_d
wait 2
up_d
camera_right
camera_right
down_s
down_a
wait 1
up_s
sleep 0.5
up_a
)
function from_corner_to_hive(
down_s
down_d
wait 0.6
up_s
wait 0.15
up_d
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
for ((i=0; i<$1; i++)); do
jump
sleep 0.513
jump
sleep 1
done
camera_left
camera_left
shift_lock_toggle
shift_lock_toggle
)
