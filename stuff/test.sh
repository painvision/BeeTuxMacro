. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

CLAIM_HIVE_PIXEL=$(get_claim_hive_c_coords)
MAKE_HONEY_PIXEL=$(get_make_honey_h_coords)
TO_MAKE_HONEY_PIXEL=$(get_to_make_honey_coords)

unhold_keys

if [ ! -e lockfiletest ]; then
    touch lockfiletest
    find_hive
    rm lockfiletest
else
    unhold_keys
    rm lockfiletest
    notify-send "macro exited"
    exit_macro
fi

