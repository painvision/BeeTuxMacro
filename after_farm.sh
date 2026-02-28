#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh
. ~/BeeTuxMacro/variables/hive_slot.sh

unhold_keys

auto_dig_off
back_to_hive
from_corner_to_hive $TRUE_HIVE_SLOT

if [[ -f ~/BeeTuxMacro/variables/should_wreath && $AUTO_WREATH = 1 ]]; then
    from_hive_to_honey_wreath_and_back
else
    e
    sleep $CONVERT_TIME
fi

if [[ -f ~/BeeTuxMacro/variables/should_stockings && $AUTO_STOCKINGS == 1 ]]; then
    from_hive_to_stockings_and_back
    rm variables/should_stockings
fi

if [[ -f ~/BeeTuxMacro/variables/should_gingerbread && $AUTO_GINGERBREAD_HOUSE == 1 ]]; then
    from_hive_to_gingerbread_house_and_back
    rm variables/should_gingerbread
fi

bash -c ~/BeeTuxMacro/pre_farm.sh
