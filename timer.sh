. ~/BeeTuxMacro/config.sh

SECONDS_STOCKINGS=0
SECONDS_WEALTH=0
SECONDS_WREATH=0
SECONDS_MOBS=0

while :; do

    if [[ $SECONDS_MOBS -ge 3600 && "$AUTO_MOBS" -eq 1 ]]; then
        touch ~/BeeTuxMacro/variables/should_mobs 2>/dev/null
        SECONDS_MOBS=0
    fi
    if [[ $SECONDS_WREATH -ge 1800 && "$AUTO_WREATH" -eq 1 ]]; then
        touch ~/BeeTuxMacro/variables/should_wreath 2>/dev/null
        SECONDS_WREATH=0
    fi

    if [[ $SECONDS_STOCKINGS -ge 3600 && "$AUTO_STOCKINGS" -eq 1 ]]; then
        touch ~/BeeTuxMacro/variables/should_stockings 2>/dev/null
        SECONDS_STOCKINGS=0
    fi

    if [[ $SECONDS_WEALTH -ge 3600 && "$AUTO_WEALTH_CLOCK" -eq 1 ]]; then
        touch ~/BeeTuxMacro/variables/should_wealth 2>/dev/null
        SECONDS_WEALTH=0
    fi

    sleep 1
    ((SECONDS_MOBS++))
    ((SECONDS_WREATH++))
    ((SECONDS_STOCKINGS++))
    ((SECONDS_WEALTH++))
done
