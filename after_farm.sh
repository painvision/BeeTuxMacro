. $MACRO_DIR/stuff/utils.sh
. $MACRO_DIR/stuff/paths.sh
. $MACRO_DIR/config.sh

# 04.03 / Merged stockings and wealth clock functions

unhold_keys

auto_dig_off
back_to_hive
from_corner_to_hive $(cat $MACRO_DIR/variables/hive_slot)

if [ -f $MACRO_DIR/variables/should_convert ]; then
if [ ! -f $MACRO_DIR/variables/cant_use_pixel_detection ]; then
    if pixel_in_trade_disabled_range $(get_coords_to_check_disabled_trade_requests); then
        re_go_to_hive_slot
        convert
        rm $MACRO_DIR/variables/should_convert
    else
        if pixel_is_white $(get_claim_hive_c_coords) || pixel_is_white $(get_make_honey_h_coords); then
            convert
            rm $MACRO_DIR/variables/should_convert
        else
            re_go_to_hive_slot
            convert
            rm $MACRO_DIR/variables/should_convert
        fi
    fi
else
    convert
    rm $MACRO_DIR/variables/should_convert
fi
fi

bash -c $MACRO_DIR/get_loot.sh

bash -c $MACRO_DIR/pre_farm.sh & exit 1
