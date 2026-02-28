#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

if [[ -f ~/BeeTuxMacro/variables/should_gingerbread && $AUTO_GINGERBREAD_HOUSE == 1 ]]; then
from_hive_to_gingerbread_house_and_back
rm ~/BeeTuxMacro/variables/should_gingerbread
fi

if [[ -f ~/BeeTuxMacro/variables/should_stockings && $AUTO_STOCKINGS == 1 ]]; then
from_hive_to_stockings_and_back
rm ~/BeeTuxMacro/variables/should_stockings
fi

if [[ -f ~/BeeTuxMacro/variables/should_wealth && $AUTO_STOCKINGS == 1 ]]; then
from_hive_to_wealth_clock
rm ~/BeeTuxMacro/variables/should_wealth
fi

go_to_field

if [[ $USE_SPRINKLER == 1 ]]; then
if [[ -f ~/BeeTuxMacro/variables/sprinklers_placed ]]; then
echo sprinklers placed
else
place_splinker
touch ~/BeeTuxMacro/variables/sprinklers_placed
fi
fi
screenshot macrostart
bash -c ~/BeeTuxMacro/farm.sh & bash -c ~/BeeTuxMacro/check_inventory.sh
