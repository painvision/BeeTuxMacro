. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

function stop_farm_and_execute_after_farm(
pkill -f farm.sh
bash -c ~/BeeTuxMacro/after_farm.sh
exit 1
)

if [[ $GATHER_INTERRUPT = 1 ]]; then
    while :
    do
        current_time=$(date +%s)

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


        # Stockings
        if [[ $AUTO_STOCKINGS == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        # Wealth
        if [[ $AUTO_WEALTH_CLOCK == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_MOBS == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_mobs)" -lt "$mobs_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_RED_FIELD_BOOSTER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_red_field_booster)" -lt "$red_field_booster_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_BLUE_FIELD_BOOSTER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_blue_field_booster)" -lt "$blue_field_booster_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_WHITE_FIELD_BOOSTER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_white_field_booster)" -lt "$white_field_booster_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_STRAWBERRY_DISPENSER == 1 || $AUTO_STRAWBERRY_DISPENSER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_strawberry_dispenser)" -lt "$strawberry_dispenser_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_BLUEBERRY_DISPENSER == 1 || $AUTO_BLUEBERRY_DISPENSER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_blueberry_dispenser)" -lt "$blueberry_dispenser_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        if [[ $AUTO_ROYAL_JELLY_DISPENSER == 1 || $AUTO_ROYAL_JELLY_DISPENSER == 2 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_royal_jelly_dispenser)" -lt "$royal_jelly_dispenser_threshold" ]; then
                stop_farm_and_execute_after_farm
            fi
        fi

        sleep 1
    done
else
    exit 1
fi
