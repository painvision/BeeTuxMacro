#23.3 seconds
function from_hive_to_pine_tree_with_red_cannon(
down_w
sleep $(calculate_time 3)
up_w
down_d
sleep $(calculate_time 6)
up_d
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
sleep $(calculate_time 0.2)
up_a
sleep 0.1
down_s
sleep $(calculate_time 0.05)
up_s
jump
sleep 0.1
down_d
sleep $(calculate_time 1)
up_d
down_w
sleep $(calculate_time 0.45)
up_w
down_d
down_s
sleep $(calculate_time 0.2)
up_s
sleep 0.3
up_d
sleep $(calculate_time 1)
e
down_d
down_s
sleep $(calculate_time 1.3)
up_s
sleep $(calculate_time 5)
jump
sleep 1
jump
sleep 1
jump
sleep $(calculate_time 13)
up_d
camera_right
camera_right
down_s
sleep $(calculate_time 1)
up_s
)

# 33.9 seconds
function from_rose_field_to_hive(
down_w
down_d
sleep $(calculate_time 3)
up_d
down_a
sleep $(calculate_time 6)
jump
jump
sleep $(calculate_time 14)
up_a
sleep 0.1
up_w
down_s
sleep $(calculate_time 0.6)
up_s
down_a
sleep $(calculate_time 8)
up_a
down_w
sleep $(calculate_time 2)
up_w
down_a
sleep $(calculate_time 2)
up_a
)

#25,4 seconds
function from_hive_to_rose_field(
down_w
sleep $(calculate_time 3)
up_w
down_s
sleep $(calculate_time 0.2)
up_s
down_d
sleep $(calculate_time 6)
up_d
sleep 0.1
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
sleep $(calculate_time 0.05)
up_a
sleep 0.2
jump
down_d
sleep $(calculate_time 1)
up_d
down_s
sleep $(calculate_time 3.5)
down_d
sleep $(calculate_time 2)
up_s
down_a
sleep $(calculate_time 0.05)
up_a
sleep 0.2
jump
sleep 0.5
down_s
sleep $(calculate_time 6)
up_d
up_s
down_w
sleep $(calculate_time 2)
up_w
down_s
down_a
sleep $(calculate_time 1)
up_a
sleep 0.5
up_s
)

function from_pine_tree_to_hive(
camera_left
camera_left
down_d
sleep $(calculate_time 1.5)
up_d
down_s
sleep $(calculate_time 1.5)
up_s
down_a
sleep $(calculate_time 12)
up_a
down_w
sleep $(calculate_time 6)
jump
down_w
sleep $(calculate_time 10)
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
sleep $(calculate_time 4)
up_w
down_s
sleep $(calculate_time 0.15)
up_s
down_a
sleep $(calculate_time 6)
up_a
down_w
sleep $(calculate_time 1)
up_w
down_a
sleep $(calculate_time 1)
up_a
)

function from_hive_to_pine_tree(

# упор в стену
down_w
sleep $(calculate_time 3)
up_w

# вдоль стены к лестнице
down_s
sleep $(calculate_time 0.2)
up_s
down_d
sleep $(calculate_time 6)
up_d

# немного вниз чтобы не упереться о возможный скин
sleep 0.1

camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
camera_left
camera_left
down_a
sleep $(calculate_time 0.05)
up_a
sleep 0.2
# залезаем на ступеньку упираясь о так называемое перило
jump
down_d
sleep $(calculate_time 1)
up_d

# вниз вдоль по перилу
down_s
sleep $(calculate_time 3.5)

# сворачиваем в сторону розы
down_d
sleep $(calculate_time 2)
up_s
down_a
sleep $(calculate_time 0.05)
up_a
sleep 0.2
up_d
sleep 0.4
down_a
sleep $(calculate_time 0.2)
up_a
down_d
# перепрыгиваем к розе
jump
sleep 0.4
down_s
sleep $(calculate_time 6)
up_d
down_a
sleep $(calculate_time 3)
up_a
sleep 1
down_d
sleep $(calculate_time 0.5)
up_d
sleep $(calculate_time 10)
up_s
down_d
sleep $(calculate_time 2)
up_d
camera_right
camera_right
down_s
down_a
sleep $(calculate_time 1)
up_s
sleep 0.5
up_a
)

function from_corner_to_hive(
down_d
sleep $(calculate_time 0.6)
up_d
down_s
sleep $(calculate_time 0.45)
up_s
camera_right
camera_right
shift_lock_toggle
shift_lock_toggle
for ((i=0; i<$1; i++)); do
jump
sleep 0.5275
jump
sleep 1
done
camera_left
camera_left
shift_lock_toggle
shift_lock_toggle
)
