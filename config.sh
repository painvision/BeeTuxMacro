#  ____           _____ _   ___  __
# | __ )  ___  __|_   _| | | \ \/ /
# |  _ \ / _ \/ _ \| | | | | |\  /
# | |_) |  __/  __/| | | |_| |/  \
# |____/ \___|\___||_|  \___//_/\_\
#                             by painvision

# Use auto hive? Otherwise enable manual hive selecting
AUTO_FIND_HIVE=1 #0 - off, 1 - on

# Enter your walking speed WITHOUT haste tokens
WALKSPEED=28

# Use sprinklers?
USE_SPRINKLER=1 #0 - off, 1 - on

# Enter slot number where your sprinkler is
SPRINKLER_SLOT=1

# Backpack detection modes, how macro should trigger back_to_hive function

# 0 - only full backpack pixel detection (only if you have grim supported)
# 1 - backpack detection + farm seconds for maximum time
# 2 - only farm for seconds

BACKPACK_DETECTION_MODE=1

# Set maximum seconds you can farm
FARM_SECONDS=6

# Approximate time to convert full backpack
CONVERT_TIME=70

# Select a field to farm!
# Quotes are mandatory
# Available options: pine, rose, strawberry, pineapple, pumpkin
FIELD="pine"

# Choose your favourite pattern to farm on fields
function farm_pattern(

# Available options:    farm_square
#                       farm_snake
#                       farm_better_snake

#                       your option here ⬇
                        farm_better_snake
)

# Collects stockings every 1 hours
# AUTO_STOCKINGS=1

# Auto kill all (except 0 bee zone, king beetle, tunnel bear, coconut crab) mobs, every 1 hour
# AUTO_MOBS=1

# Wealth clock every 1 hours
# AUTO_WEALTH_CLOCK=1

# Honey wreath for converting
AUTO_WREATH=1

# Uncomment if you configured and confirm using this config
CONFIGURED=""
