. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

# Creates variables for dispensers and applies right cooldown, so very first launch of the macro will always trigger dispensers

if [[ $AUTO_STOCKINGS = 1 || $AUTO_STOCKINGS = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_stockings ]; then
    touch ~/BeeTuxMacro/variables/should_stockings
    echo "$(date +%s) - 3600" | bc > ~/BeeTuxMacro/variables/should_stockings
    fi
fi

if [[ $AUTO_MOBS = 1 || $AUTO_MOBS = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_mobs ]; then
    touch ~/BeeTuxMacro/variables/should_mobs
    echo "$(date +%s) - 3600" | bc > ~/BeeTuxMacro/variables/should_mobs
    fi
fi

if [[ $AUTO_WREATH = 1 || $AUTO_WREATH = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_wreath ]; then
    touch ~/BeeTuxMacro/variables/should_wreath
    echo "$(date +%s) - 1800" | bc > ~/BeeTuxMacro/variables/should_wreath
    fi
fi

if [[ $AUTO_WEALTH_CLOCK = 1 || $AUTO_WEALTH_CLOCK = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_wealth ]; then
    touch ~/BeeTuxMacro/variables/should_wealth
    echo "$(date +%s) - 3600" | bc > ~/BeeTuxMacro/variables/should_wealth
    fi
fi

if [[ $AUTO_RED_FIELD_BOOSTER = 1 || $AUTO_RED_FIELD_BOOSTER = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_red_field_booster ]; then
    touch ~/BeeTuxMacro/variables/should_red_field_booster
    echo "$(date +%s) - 2700" | bc > ~/BeeTuxMacro/variables/should_red_field_booster
    fi
fi

if [[ $AUTO_BLUE_FIELD_BOOSTER = 1 || $AUTO_BLUE_FIELD_BOOSTER = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_blue_field_booster ]; then
    touch ~/BeeTuxMacro/variables/should_blue_field_booster
    echo "$(date +%s) - 2700" | bc > ~/BeeTuxMacro/variables/should_blue_field_booster
    fi
fi

if [[ $AUTO_WHITE_FIELD_BOOSTER = 1 || $AUTO_WHITE_FIELD_BOOSTER = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_white_field_booster ]; then
    touch ~/BeeTuxMacro/variables/should_white_field_booster
    echo "$(date +%s) - 2700" | bc > ~/BeeTuxMacro/variables/should_white_field_booster
    fi
fi

if [[ $AUTO_STRAWBERRY_DISPENSER = 1 || $AUTO_STRAWBERRY_DISPENSER  = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_strawberry_dispenser ]; then
    touch ~/BeeTuxMacro/variables/should_strawberry_dispenser
    echo "$(date +%s) - 14400" | bc > ~/BeeTuxMacro/variables/should_strawberry_dispenser
    fi
fi

if [[ $AUTO_BLUEBERRY_DISPENSER = 1 || $AUTO_BLUEBERRY_DISPENSER  = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_blueberry_dispenser ]; then
    touch ~/BeeTuxMacro/variables/should_blueberry_dispenser
    echo "$(date +%s) - 14400" | bc > ~/BeeTuxMacro/variables/should_blueberry_dispenser
    fi
fi

if [[ $AUTO_ROYAL_JELLY_DISPENSER = 1 || $AUTO_ROYAL_JELLY_DISPENSER  = 2 ]]; then
    if [ ! -f ~/BeeTuxMacro/variables/should_royal_jelly_dispenser ]; then
    touch ~/BeeTuxMacro/variables/should_royal_jelly_dispenser
    echo "$(date +%s) - 79200" | bc > ~/BeeTuxMacro/variables/should_royal_jelly_dispenser
    fi
fi


current_time=$(date +%s)

# we substract dispensers cooldown from current epoch time , so we can use -lt thing in bash to know if we can
# claim dispenser or not

stockings_threshold=$((current_time - 3600))
wealth_clock_threshold=$((current_time - 3600))
honey_wreath_threshold=$((current_time - 1800))
mobs_threshold=$((current_time - 3600))
red_field_booster_threshold=$((current_time - 2700))
blue_field_booster_threshold=$((current_time - 2700))
white_field_booster_threshold=$((current_time - 2700))
strawberry_dispenser_threshold=$((current_time - 14400))
blueberry_dispenser_threshold=$((current_time - 14400))
royal_jelly_dispenser_threshold=$((current_time - 79200))

# Stockings + Wealth combined
if [[ $AUTO_STOCKINGS == 1 || $AUTO_STOCKINGS == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
        if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
            if [[ $AUTO_WEALTH_CLOCK == 1 || $AUTO_WEALTH_CLOCK == 2 ]]; then
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

# Wealth + Stockings combined

if [[ $AUTO_WEALTH_CLOCK == 1 || $AUTO_WEALTH_CLOCK == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
        if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
            if [[ $AUTO_STOCKINGS == 1 || $AUTO_STOCKINGS == 2 ]]; then
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

if [[ $AUTO_MOBS == 1 || $AUTO_MOBS == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_mobs)" -lt "$mobs_threshold" ]; then
        farm_mobs
        date +%s > ~/BeeTuxMacro/variables/should_mobs
    fi
fi

if [[ $AUTO_RED_FIELD_BOOSTER == 1 || $AUTO_RED_FIELD_BOOSTER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_red_field_booster)" -lt "$red_field_booster_threshold" ]; then
        from_hive_to_red_field_booster
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_red_field_booster
    fi
fi

if [[ $AUTO_BLUE_FIELD_BOOSTER == 1 || $AUTO_BLUE_FIELD_BOOSTER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_blue_field_booster)" -lt "$blue_field_booster_threshold" ]; then
        from_hive_to_blue_field_booster
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_blue_field_booster
    fi
fi

if [[ $AUTO_WHITE_FIELD_BOOSTER == 1 || $AUTO_BLUE_FIELD_BOOSTER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_white_field_booster)" -lt "$white_field_booster_threshold" ]; then
        from_hive_to_white_field_booster
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_white_field_booster
    fi
fi

if [[ $AUTO_STRAWBERRY_DISPENSER == 1 || $AUTO_STRAWBERRY_DISPENSER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_strawberry_dispenser)" -lt "$strawberry_dispenser_threshold" ]; then
        from_hive_to_strawberry_dispenser
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_strawberry_dispenser
    fi
fi

if [[ $AUTO_BLUEBERRY_DISPENSER == 1 || $AUTO_BLUEBERRY_DISPENSER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_blueberry_dispenser)" -lt "$blueberry_dispenser_threshold" ]; then
        from_hive_to_blueberry_dispenser
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_blueberry_dispenser
    fi
fi

if [[ $AUTO_ROYAL_JELLY_DISPENSER == 1 || $AUTO_ROYAL_JELLY_DISPENSER == 2 ]]; then
    if [ "$(cat ~/BeeTuxMacro/variables/should_royal_jelly_dispenser)" -lt "$royal_jelly_dispenser_threshold" ]; then
        from_hive_to_royal_jelly_dispenser
        e
        sleep 2
        reset
        date +%s > ~/BeeTuxMacro/variables/should_royal_jelly_dispenser
    fi
fi

exit 1
