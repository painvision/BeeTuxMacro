. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

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

go_to_field

if [[ $USE_SPRINKLER == 1 ]]; then
    if [[ -f ~/BeeTuxMacro/variables/sprinklers_placed ]]; then
        echo sprinklers placed
    else
        place_splinker
        touch ~/BeeTuxMacro/variables/sprinklers_placed 2>/dev/null
    fi
fi
bash -c ~/BeeTuxMacro/farm.sh & bash -c ~/BeeTuxMacro/check_inventory.sh
