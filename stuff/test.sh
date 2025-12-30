. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
unhold_keys
if [ ! -e lockfiletest ]; then
touch lockfiletest
while :
do
if [[ "$(pixel_color $FULL_BACKPACK_PIXEL)" == "$FULL_BACKPACK_PIXEL_COLOR" ]]; then
        notify-send a
        sleep 2
    fi

done
rm lockfiletest
else
unhold_keys
rm lockfiletest
exit_macro
fi

