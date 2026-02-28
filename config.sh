#  ____           _____ _   ___  __
# | __ )  ___  __|_   _| | | \ \/ /
# |  _ \ / _ \/ _ \| | | | | |\  /
# | |_) |  __/  __/| | | |_| |/  \
# |____/ \___|\___||_|  \___//_/\_\
#                             by painvision

# Enter your walking speed WITHOUT haste tokens
WALKSPEED=28

# Use sprinklers
USE_SPRINKLER=1 #0 - off, 1 - on

# Enter slot number where your sprinkler is
SPRINKLER_SLOT=1

# Backpack detection modes, how macro should trigger back_to_hive function

# 0 - only full backpack pixel detection (only if you have grim supported)
# 1 - backpack detection + farm seconds for maximum time
# 2 - only farm for seconds

BACKPACK_DETECTION_MODE=1

# Set maximum seconds you can farm
FARM_SECONDS=600 #100 minutes

# Approximate time to convert full backpack
CONVERT_TIME=70

function go_to_field(
# Select path function from hive to field

# Available options:    from_hive_to_rose_field
#                       from_hive_to_pine_tree
#                       from_hive_to_pine_tree_with_red_cannon
#                       from_hive_to_pumpkin_with_red_cannon
#                       from_hive_to_pineapple_with_red_cannon
#                       from_hive_to_strawberry_with_red_cannon


#                       ENTER YOUR OPTION HERE ⬇
                        from_hive_to_pine_tree_with_red_cannon
)

function back_to_hive(
# Select path function from field to hive

# Available options: from_rose_field_to_hive
#                    from_pine_tree_to_hive
#                    from_pumpkin_to_hive
#                    from_pineapple_to_hive
#                    from_strawberry_to_hive

#                    ENTER YOUR OPTION HERE ⬇
                     from_pine_tree_to_hive

)

function farm_pattern(

# Choose your favourite pattern to farm on fields

# Available options:    farm_square
#                       farm_snake
#                       farm_better_snake

#                       ⬇ ENTER YOUR OPTION HERE
                        farm_better_snake
)

# Collects gingerbread house every 2 hours
# AUTO_GINGERBREAD_HOUSE=1

# Collects stockings every 1 hours
AUTO_STOCKINGS=1

# NEW! Auto kill all (except 0 bee zone, king beetle, tunnel bear, coconut crab) mobs  every 1 hour
AUTO_MOBS=1

# Wealth clock every 1 hours
AUTO_WEALTH_CLOCK=1

# Honey wreath for converting
AUTO_WREATH=1

# Uncomment if you configured and confirm using this config
# CONFIGURED=""
