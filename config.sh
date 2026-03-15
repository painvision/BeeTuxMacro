#  ____           _____
# | __ )  ___  __|_   _|   ___  __
# |  _ \ / _ \/ _ \| || | | \ \/ /
# | |_) |  __/  __/| || |_| |>  <
# |____/ \___|\___||_| \__,_/_/\_\

# Open source Bee Swarm Simulator macro, written in bash and ydotool for Linux

#  __  __    _    ___ _   _
# |  \/  |  / \  |_ _| \ | |
# | |\/| | / _ \  | ||  \| |
# | |  | |/ ___ \ | || |\  |
# |_|  |_/_/   \_\___|_| \_| settings
#

# Enter your walking speed WITHOUT haste tokens
WALKSPEED=28

# Use sprinklers?
USE_SPRINKLER=1 #0 - off, 1 - on

# Enter slot number where your sprinkler is
SPRINKLER_SLOT=1 #from 1 to 6

# Use auto hive?
AUTO_FIND_HIVE=1 #0 - off, 1 - on

#  _____ ___ _____ _     ____
# |  ___|_ _| ____| |   |  _ \
# | |_   | ||  _| | |   | | | |
# |  _|  | || |___| |___| |_| |
# |_|   |___|_____|_____|____/ options
#

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

#   ____ ___  _   ___     _______ ____ _____ ___ _   _  ____
#  / ___/ _ \| \ | \ \   / / ____|  _ \_   _|_ _| \ | |/ ___|
# | |  | | | |  \| |\ \ / /|  _| | |_) || |  | ||  \| | |  _
# | |__| |_| | |\  | \ V / | |___|  _ < | |  | || |\  | |_| |
#  \____\___/|_| \_|  \_/  |_____|_| \_\|_| |___|_| \_|\____| options
#

# Backpack detection modes, how macro should trigger back_to_hive function

# 0 - only full backpack pixel detection (only if you have grim supported)
# 1 - backpack detection + farm seconds for maximum time
# 2 - only farm for seconds

BACKPACK_DETECTION_MODE=1

# Set maximum seconds you can farm
FARM_SECONDS=420

# Approximate time to convert full backpack
CONVERT_TIME=100

#  _____ _____    _  _____ _   _ ____  _____ ____
# |  ___| ____|  / \|_   _| | | |  _ \| ____/ ___|
# | |_  |  _|   / _ \ | | | | | | |_) |  _| \___ \
# |  _| | |___ / ___ \| | | |_| |  _ <| |___ ___) |
# |_|   |_____/_/   \_\_|  \___/|_| \_\_____|____/ here
#

# Collects stockings every 1 hours
AUTO_STOCKINGS=1

# Auto kill all (except 0 bee zone, king beetle, tunnel bear, coconut crab) mobs, every 1 hour
AUTO_MOBS=1

# Wealth clock every 1 hours
AUTO_WEALTH_CLOCK=1

# Honey wreath for converting
AUTO_WREATH=1

# Uncomment if you configured and confirm using this config
# CONFIGURED=""
