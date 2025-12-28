#23.3 seconds
function from_hive_to_pine_tree_with_red_cannon(
down_w
usleep 3000000
up_w
down_d
usleep 6000000
up_d
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
usleep 200000
up_a
usleep 100000
down_s
usleep 50000
up_s
jump
usleep 100000
down_d
usleep 1000000
up_d
down_w
usleep 450000
up_w
down_d
down_s
usleep 200000
up_s
usleep 300000
up_d
usleep 1000000
e
down_d
usleep 5000000
jump
usleep 1000000
jump
usleep 13000000
up_d
camera_right
camera_right
down_s
usleep 1000000
up_s
)

# 33.9 seconds
function from_rose_field_to_hive(
down_w
down_d
usleep 3000000
up_d
down_a
usleep 6000000
jump
jump
usleep 14000000
up_a
usleep 100000
up_w
down_s
usleep 600000
up_s
down_a
usleep 8000000
up_a
down_w
usleep 2000000
up_w
down_a
usleep 2000000
up_a
)

#25,4 seconds
function from_hive_to_rose_field(
down_w
usleep 3000000
up_w
down_s
usleep 200000
up_s
down_d
usleep 6000000
up_d
usleep 100000
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
usleep 50000
up_a
usleep 200000
jump
down_d
usleep 1000000
up_d
down_s
usleep 3500000
down_d
usleep 2000000
up_s
down_a
usleep 50000
up_a
usleep 200000
jump
usleep 500000
down_s
usleep 6000000
up_d
up_s
down_w
usleep 2000000
up_w
down_s
down_a
usleep 1000000
up_a
usleep 500000
up_s
)

function from_pine_tree_to_hive(
camera_left
camera_left
down_d
usleep 1500000
up_d
down_s
usleep 1500000
up_s
down_a
usleep 12000000
up_a
down_w
usleep 6000000
jump
down_w
usleep 10000000
up_w
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
jump
usleep 527500
jump
sleep 1
camera_left
camera_left
down_w
usleep 4000000
up_w
down_s
usleep 150000
up_s
down_a
usleep 6000000
up_a
down_w
usleep 1000000
up_w
down_a
usleep 1000000
up_a
)

function from_hive_to_pine_tree(

# упор в стену
down_w
usleep 3000000
up_w

# вдоль стены к лестнице
down_s
usleep 200000
up_s
down_d
usleep 6000000
up_d

# немного вниз чтобы не упереться о возможный скин
usleep 100000

camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
usleep 50000
up_a
usleep 200000
# залезаем на ступеньку упираясь о так называемое перило
jump
down_d
usleep 1000000
up_d

# вниз вдоль по перилу
down_s
usleep 3500000

# сворачиваем в сторону розы
down_d
usleep 2000000
up_s
down_a
usleep 50000
up_a
usleep 200000
up_d
usleep 400000
down_a
usleep 200000
up_a
down_d
# перепрыгиваем к розе
jump
usleep 400000
down_s
usleep 6000000
up_d
down_a
usleep 3000000
up_a
usleep 1000000
down_d
usleep 500000
up_d
usleep 10000000
up_s
down_d
usleep 2000000
up_d
camera_right
camera_right
down_s
down_a
usleep 1000000
up_s
usleep 500000
up_a
)

function from_corner_to_hive(
down_d
usleep 600000
up_d
down_s
usleep 450000
up_s
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
for ((i=0; i<$1; i++)); do
jump
usleep 527500
jump
sleep 1
done
camera_left
camera_left
shift_lock_toggle
shift_lock_toggle
)
