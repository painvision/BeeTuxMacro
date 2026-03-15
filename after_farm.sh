. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

# 04.03 / Merged stockings and wealth clock functions

unhold_keys

auto_dig_off
back_to_hive
from_corner_to_hive $(cat ~/BeeTuxMacro/variables/hive_slot)

# 05.03 / Maded converting more reliable (i hope)

if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
    re_go_to_hive_slot
    convert
else
    if pixel_is_white $(get_claim_hive_c_coords) || pixel_is_white $(get_make_honey_h_coords); then
        convert
    else
        re_go_to_hive_slot
        convert
    fi
fi

current_time=$(date +%s)

stockings_threshold=$((current_time - 3600))
wealth_clock_threshold=$((current_time - 3600))
honey_wreath_threshold=$((current_time - 1800))
mobs_threshold=$((current_time - 3600))

# Stockings
if [[ $AUTO_STOCKINGS == 1 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
        if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
            if [[ $AUTO_WEALTH_CLOCK == 1 ]]; then
            from_hive_to_wealth_clock_and_stockings
            date +%s > ~/BeeTuxMacro/variables/should_stockings
            date +%s > ~/BeeTuxMacro/variables/should_wealth
            fi
        else
            from_hive_to_stockings_and_back
            date +%s > ~/BeeTuxMacro/variables/should_stockings
        fi
    fi
fi

# Wealth
if [[ $AUTO_WEALTH_CLOCK == 1 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
        if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
            if [[ $AUTO_STOCKINGS == 1 ]]; then
                from_hive_to_wealth_clock_and_stockings
                date +%s > ~/BeeTuxMacro/variables/should_stockings
                date +%s > ~/BeeTuxMacro/variables/should_wealth
            fi
        else
            from_hive_to_wealth_clock
            date +%s > ~/BeeTuxMacro/variables/should_wealth
        fi
    fi
fi

if [[ $AUTO_MOBS == 1 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_mobs)" -lt "$mobs_threshold" ]; then
        farm_mobs
        date +%s > ~/BeeTuxMacro/variables/should_mobs
    fi
fi

bash -c ~/BeeTuxMacro/pre_farm.sh
