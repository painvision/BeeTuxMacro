#  ____           _____ _   ___  __
# | __ )  ___  __|_   _| | | \ \/ /
# |  _ \ / _ \/ _ \| | | | | |\  /
# | |_) |  __/  __/| | | |_| |/  \
# |____/ \___|\___||_|  \___//_/\_\
#                             by painvision

# Use sprinklers
USE_SPRINKLER=1 #0 - off, 1 - on

# Enter the number where your sprinkler is
SPRINKLER_SLOT=1

# Enter your walking speed WITHOUT haste tokens
WALKSPEED=28

# Set maximum seconds you can farm. This won't cancel full backpack detection, just a protection if it fails for too long
FARM_SECONDS=300 #5 minutes

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

                        from_hive_to_strawberry_with_red_cannon
)

function back_to_hive(
# Select path function from field to hive

# Available options: from_rose_field_to_hive
#                    from_pine_tree_to_hive
#                    from_pumpkin_to_hive
#                    from_pineapple_to_hive
#                    from_strawberry_to_hive

                     from_strawberry_to_hive

)

function farm_pattern(
# Choose your favourite pattern to farm on fields

# Available options:    farm_square
#                       farm_snake
#                       farm_better_snake

                        farm_better_snake
)

# Type "0" if you won't use autoscreenshots

# Screenshots when:
# - Started a macro
# - Converted pollen

# SCREENSHOTS=0

# Collects gingerbread house every 2 hours
# AUTO_GINGERBREAD_HOUSE=1

# Collects stockings every 1 hours
# AUTO_STOCKINGS=1

# Wealth clock every 1 hours
# AUTO_WEALTH_CLOCK=1

# Should do honey wreath?
# AUTO_WREATH=1

# Uncomment if you configured and confirm using this config
# CONFIGURED=""
