. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if [[ -f ~/BeeTuxMacro/variables/should_stockings && $AUTO_STOCKINGS == 1 ]]; then
    if [[ -f ~/BeeTuxMacro/variables/should_wealth && $AUTO_WEALTH_CLOCK == 1 ]]; then
        from_hive_to_wealth_clock_and_stockings
        rm ~/BeeTuxMacro/variables/should_stockings 2>/dev/null
        rm ~/BeeTuxMacro/variables/should_wealth 2>/dev/null
    else
        from_hive_to_stockings_and_back
        rm ~/BeeTuxMacro/variables/should_stockings 2>/dev/null
    fi
fi

if [[ -f ~/BeeTuxMacro/variables/should_wealth && $AUTO_WEALTH_CLOCK == 1 ]]; then
    if [[ -f ~/BeeTuxMacro/variables/should_stockings && $AUTO_STOCKINGS == 1 ]]; then
        from_hive_to_wealth_clock_and_stockings
        rm ~/BeeTuxMacro/variables/should_stockings 2>/dev/null
        rm ~/BeeTuxMacro/variables/should_wealth 2>/dev/null
    else
        from_hive_to_wealth_clock
        rm ~/BeeTuxMacro/variables/should_wealth 2>/dev/null
    fi
fi

if [[ -f ~/BeeTuxMacro/variables/should_mobs && $AUTO_MOBS == 1 ]]; then
farm_mobs
rm ~/BeeTuxMacro/variables/should_mobs 2>/dev/null
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
