#!/bin/bash

export MACRO_DIR=$(cd $(dirname "$BASH_SOURCE[0]") && pwd)
. $MACRO_DIR/stuff/utils.sh
. $MACRO_DIR/stuff/paths.sh
. $MACRO_DIR/config.sh

RECONNECT_COORDS=$(get_reconnect_coords)

while :
do
    if pixel_is_reconnect_color $RECONNECT_COORDS; then
        if [ ! -d "$MACRO_DIR/variables/" ]; then
            mkdir $MACRO_DIR/variables/
        fi
        rm $MACRO_DIR/variables/hive_slot
        if [ -e $MACRO_DIR/variables/need_hive_reclaim ]; then
            move_mouse_on_coords 773 473
            sleep 1
            lmb_click
            lmb_click
            sleep 20
        else
        touch $MACRO_DIR/variables/need_hive_reclaim
        unhold_keys 2>/dev/null
        unhold_keys 2>/dev/null
        unhold_keys 2>/dev/null
        for i in {1..10}:
        do
            pkill -f test.sh 2>/dev/null
            pkill -f start.sh 2>/dev/null
            pkill -f farm.sh 2>/dev/null
            pkill -f pre_farm.sh 2>/dev/null
            pkill -f check_inventory.sh 2>/dev/null
            pkill -f after_farm.sh 2>/dev/null
        done
        move_mouse_on_coords 773 473
        lmb_click
        lmb_click
        sleep 20
        fi
    else
        if [ -e $MACRO_DIR/variables/need_hive_reclaim ]; then
            find_hive
            rm $MACRO_DIR/variables/need_hive_reclaim
            bash -c $MACRO_DIR/pre_farm.sh &
        fi
    fi
    sleep 60
done
