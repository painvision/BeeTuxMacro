. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

RECONNECT_COORDS=$(get_reconnect_coords)

while :
do
    if pixel_is_reconnect_color $RECONNECT_COORDS; then
        if [ ! -d "~/BeeTuxMacro/variables/" ]; then
            mkdir ~/BeeTuxMacro/variables/
        fi
        rm ~/BeeTuxMacro/variables/hive_slot
        if [ -e ~/BeeTuxMacro/variables/need_hive_reclaim ]; then
            move_mouse_on_coords 773 473
            lmb_click
            lmb_click
            sleep 20
        else
        touch ~/BeeTuxMacro/variables/need_hive_reclaim
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
        if [ -e ~/BeeTuxMacro/variables/need_hive_reclaim ]; then
            find_hive
            rm ~/BeeTuxMacro/variables/need_hive_reclaim
            bash -c ~/BeeTuxMacro/pre_farm.sh &
        fi
    fi
    sleep 60
done
