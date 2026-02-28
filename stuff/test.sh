. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

unhold_keys

if [ ! -e lockfiletest ]; then
    touch lockfiletest
    # 👇

    farm_mobs

    rm lockfiletest
else
    unhold_keys
    rm lockfiletest
    exit_macro
fi

