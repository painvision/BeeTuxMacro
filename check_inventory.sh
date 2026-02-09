. ~/BeeTuxMacro/stuff/utils.sh

while :
do
    if pixel_in_red_range $(get_pixel_coords); then
        if pixel_in_red_range $(get_pixel_coords); then
            pkill -f farm.sh
            bash -c ~/BeeTuxMacro/after_farm.sh
            pkill -f check_inventory.sh
        fi
    fi
sleep 1
done
