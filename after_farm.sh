. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

# 04.03 / Merged stockings and wealth clock functions

unhold_keys

auto_dig_off
back_to_hive
from_corner_to_hive $(cat ~/BeeTuxMacro/variables/hive_slot)

if [ -f ~/BeeTuxMacro/variables/should_convert ]; then
if [ ! -f ~/BeeTuxMacro/variables/cant_use_pixel_detection ]; then
    if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
        re_go_to_hive_slot
        convert
        rm ~/BeeTuxMacro/variables/should_convert
    else
        if pixel_is_white $(get_claim_hive_c_coords) || pixel_is_white $(get_make_honey_h_coords); then
            convert
            rm ~/BeeTuxMacro/variables/should_convert
        else
            re_go_to_hive_slot
            convert
            rm ~/BeeTuxMacro/variables/should_convert
        fi
    fi
else
    convert
    rm ~/BeeTuxMacro/variables/should_convert
fi
fi

bash -c ~/BeeTuxMacro/get_loot.sh

bash -c ~/BeeTuxMacro/pre_farm.sh & exit 1
