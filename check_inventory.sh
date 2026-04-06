. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/config.sh

START_TIME=$SECONDS

if [ ! -f ~/BeeTuxMacro/variables/cant_use_pixel_detection ]; then
    if [[ $BACKPACK_DETECTION_MODE == 0 || $BACKPACK_DETECTION_MODE == 1 ]]; then
        FULL_BACKPACK_PIXEL=$(get_full_backpack_coords)
    fi
fi


if [[ $BACKPACK_DETECTION_MODE = 2 || -f ~/BeeTuxMacro/variables/cant_use_pixel_detection  ]] ; then # only farming for time
    echo "backup"
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            touch ~/BeeTuxMacro/variables/time_exceed
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & exit 1
        fi
        sleep 1
    done
fi

if [ $BACKPACK_DETECTION_MODE = 0 ]; then # only pixel detection
    while :
    do
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & exit 1
        fi
    done
fi

if [ $BACKPACK_DETECTION_MODE = 1 ]; then # checking inventory + maximum amount of seconds to farm
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            touch ~/BeeTuxMacro/variables/time_exceed
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & exit 1
        else
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh & exit 1
        fi
        fi
    done
fi
