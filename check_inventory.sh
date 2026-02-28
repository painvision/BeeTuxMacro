#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/config.sh

START_TIME=$SECONDS

while :
do
    ELAPSED=$(( SECONDS - START_TIME )) #timer

    if [ $BACKPACK_DETECTION_MODE = 0 ]; then # only pixel detection
        if pixel_in_red_range $(get_pixel_coords); then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            pkill -f check_inventory.sh
        fi
    fi

    if [ $BACKPACK_DETECTION_MODE = 1 ]; then # checking inventory + maximum amount of seconds to farm

    # ----*'*-._.-*'*--> hello to anyone reading ts
    #                    yeah it is poorly made
    #                    and it just works
    #                    i dont give a fuck

        if pixel_in_red_range $(get_pixel_coords); then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            pkill -f check_inventory.sh
        else
            if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
                pkill -f farm.sh
                bash -c ~/BeeTuxMacro/after_farm.sh
                pkill -f check_inventory.sh
            fi
        fi
    fi

    if [ $BACKPACK_DETECTION_MODE = 2 ]; then # only farming for time
        if [[ "$ELAPSED" -gt "$FARM_SECONDS" ]]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            pkill -f check_inventory.sh
        fi
    fi

sleep 1
done
