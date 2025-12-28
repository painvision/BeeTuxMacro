#  ____           _____ _   ___  __
# | __ )  ___  __|_   _| | | \ \/ /
# |  _ \ / _ \/ _ \| | | | | |\  /
# | |_) |  __/  __/| | | |_| |/  \
# |____/ \___|\___||_|  \___//_/\_\
#                             by painvision

# You should claim a hive before launching macro
# Enter the number of your hive in order from left to right
HIVE_SLOT=1

# Enter the number where your sprinkler is
SPRINKLER_SLOT=1

# Enter your walking speed WITHOUT haste tokens
WALKSPEED=28

# Convert when backpack reaches this percentage (0-100)
# Set to 0 to use farming for DURATION

CONVERT_AT_PERCENTAGE=0
DURATION=120

# Coordinates for backpack text area (use slurp command)
BACKPACK_COORDS="745,34 121x15"
# Make exact same process but when backpack is empty
CONVERT_COORDS="745,29 172x22"


function go_to_field(
# Select path function from hive to field

# Available options:    from_hive_to_rose_field
#                       from_hive_to_pine_tree, from_hive_to_pine_tree_with_red_cannon
#                       from_hive_to_pumpkin_with_red_cannon

                        from_hive_to_pumpkin_with_red_cannon
)

function back_to_hive(
# Select path function from hive to field

# Available options: from_rose_field_to_hive
#                    from_pine_tree_to_hive
#                    from_pumpkin_to_hive

                     from_pumpkin_to_hive

)

function farm_pattern(
# Choose your favourite pattern to farm on fields

# Available options:    farm_square
#                       farm_snake

                        farm_snake
)




# Type "0" if you won't use autoscreenshots

# Screenshots when:
# - Started a macro
# - Converted pollen

SCREENSHOTS=0

# Uncomment if you confirm using this config
# CONFIGURED=""
