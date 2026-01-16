#!/bin/bash
. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
unhold_keys
if [ ! -e lockfiletest ]; then
touch lockfiletest
farm_better_snake
rm lockfiletest
else
unhold_keys
rm lockfiletest
exit_macro
fi

