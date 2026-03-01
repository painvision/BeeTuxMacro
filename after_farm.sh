. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh
. ~/BeeTuxMacro/variables/hive_slot.sh

unhold_keys

auto_dig_off
back_to_hive
from_corner_to_hive $TRUE_HIVE_SLOT

if [[ -f ~/BeeTuxMacro/variables/should_wreath && $AUTO_WREATH = 1 ]]; then
    from_hive_to_honey_wreath_and_back
else
    e
    sleep $CONVERT_TIME
fi

if [[ -f ~/BeeTuxMacro/variables/should_stockings && $AUTO_STOCKINGS == 1 ]]; then
    from_hive_to_stockings_and_back
    rm variables/should_stockings 2>/dev/null
fi

if [[ -f ~/BeeTuxMacro/variables/should_mobs && $AUTO_MOBS == 1 ]]; then
    farm_mobs
    rm variables/should_mobs 2>/dev/null
fi

if [[ -f ~/BeeTuxMacro/variables/should_wealth && $AUTO_WEALTH_CLOCK == 1 ]]; then
    from_hive_to_wealth_clock
    rm variables/should_wealth 2>/dev/null
fi

bash -c ~/BeeTuxMacro/pre_farm.sh
