SECONDS_GINGER=0
SECONDS_STOCKINGS=0
SECONDS_WEALTH=0
SECONDS_WREATH=0

while :
do
if [ $SECONDS_GINGER -ge 7200 && $AUTO_GINGERBREAD_HOUSE = 1 ]]; then
touch ~/BeeTuxMacro/variables/should_gingerbread
SECONDS_GINGER=0
fi
if [[ $SECONDS_WREATH -ge 1800 && $AUTO_WREATH = 1 ]]; then
    touch ~/BeeTuxMacro/variables/should_wreath
    SECONDS_WREATH=0
fi
if [[ $SECONDS_STOCKINGS -ge 3600 && $AUTO_STOCKINGS = 1 ]]; then
    touch ~/BeeTuxMacro/variables/should_stockings
    SECONDS_STOCKINGS=0
fi
if [[ $SECONDS_WEALTH -ge 3600 && $AUTO_WEALTH_CLOCK = 1 ]]; then
    touch ~/BeeTuxMacro/variables/should_wealth
    SECONDS_WEALTH=0
fi
sleep 1
    ((SECONDS_GINGER++))
    ((SECONDS_STOCKINGS++))
    ((SECONDS_WEALTH++))
    ((SECONDS_WREATH++))
done
