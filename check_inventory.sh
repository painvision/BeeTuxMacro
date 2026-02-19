#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/config.sh

START_TIME=$SECONDS
while :
do
    ELAPSED=$(( SECONDS - START_TIME ))
    if pixel_in_red_range $(get_pixel_coords); then
        if [ "$ELAPSED" -gt "$FARM_SECONDS" ]; then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.s
            pkill -f check_inventory.sh
        fi
    fi
    sleep 1
done
