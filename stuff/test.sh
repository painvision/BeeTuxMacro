. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

unhold_keys

if [ ! -e lockfiletest ]; then
    touch lockfiletest
    while :
    do
    if pixel_in_red_range $(get_coords_to_check_disabled_trade_requests); then
        notify-send yes
    else
        notify-send "no $(pixel_in_red_range $(get_coords_to_check_disabled_trade_requests))"
    fi
    done
    rm lockfiletest
else
    unhold_keys
    rm lockfiletest
    notify-send "macro exited"
fi

