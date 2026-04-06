. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if [[ $GATHER_INTERRUPT = 1 ]]; then
    while :
    do
        current_time=$(date +%s)

        stockings_threshold=$((current_time - 3600))
        wealth_clock_threshold=$((current_time - 3600))
        mobs_threshold=$((current_time - 3600))

        # Stockings
        if [[ $AUTO_STOCKINGS == 1 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_stockings)" -lt "$stockings_threshold" ]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            exit 1
            fi
        fi

        # Wealth
        if [[ $AUTO_WEALTH_CLOCK == 1 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_wealth)" -lt "$wealth_clock_threshold" ]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            exit 1
            fi
        fi

        if [[ $AUTO_MOBS == 1 ]]; then
            if [ "$(cat ~/BeeTuxMacro/variables/should_mobs)" -lt "$mobs_threshold" ]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            exit 1
            fi
        fi
        sleep 1
    done
else
    exit 1
fi
