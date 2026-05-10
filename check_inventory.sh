. $MACRO_DIR/stuff/utils.sh
. $MACRO_DIR/config.sh

START_TIME=$SECONDS

if [ ! -f $MACRO_DIR/variables/cant_use_pixel_detection ]; then
    if [[ $BACKPACK_DETECTION_MODE == 0 || $BACKPACK_DETECTION_MODE == 1 ]]; then
        FULL_BACKPACK_PIXEL=$(get_full_backpack_coords)
    fi
fi


if [[ $BACKPACK_DETECTION_MODE = 2 || -f $MACRO_DIR/variables/cant_use_pixel_detection  ]] ; then # only farming for time
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            touch $MACRO_DIR/variables/time_exceed
            touch $MACRO_DIR/variables/should_convert
            pkill -f farm.sh
            bash -c $MACRO_DIR/after_farm.sh & exit 1
        fi
        sleep 1
    done
fi

if [ $BACKPACK_DETECTION_MODE = 0 ]; then # only pixel detection
    while :
    do
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            pkill -f farm.sh
            touch $MACRO_DIR/variables/should_convert
            bash -c $MACRO_DIR/after_farm.sh & exit 1
        fi
    done
fi

if [ $BACKPACK_DETECTION_MODE = 1 ]; then # checking inventory + maximum amount of seconds to farm
    while :
    do
        ELAPSED=$(( SECONDS - START_TIME )) #timer
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            touch $MACRO_DIR/variables/time_exceed
            touch $MACRO_DIR/variables/should_convert
            pkill -f farm.sh
            bash -c $MACRO_DIR/after_farm.sh & exit 1
        else
        if pixel_in_red_range $FULL_BACKPACK_PIXEL; then
            touch $MACRO_DIR/variables/should_convert
            pkill -f farm.sh
            bash -c $MACRO_DIR/after_farm.sh & exit 1
        fi
        fi
    done
fi
