. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/config.sh

START_TIME=$SECONDS


# 04.03 / Precalculating needed pixel for full backpack detection instead of constant xrandr requesting
if [[ $BACKPACK_DETECTION_MODE == 0 || $BACKPACK_DETECTION_MODE == 1 ]]; then
    FULL_BACKPACK_PIXEL=$(get_full_backpack_coords)
fi

if [ $BACKPACK_DETECTION_MODE = 0 ]; then # only pixel detection
    while :
    do
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & pkill -f check_inventory.sh
        fi
    done
fi

if [ $BACKPACK_DETECTION_MODE = 1 ]; then # checking inventory + maximum amount of seconds to farm
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & pkill -f check_inventory.sh
        else
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & pkill -f check_inventory.sh
        fi
        fi
    done
fi

if [ $BACKPACK_DETECTION_MODE = 2 ]; then # only farming for time
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & pkill -f check_inventory.sh
        fi
        sleep 1
    done
fi
