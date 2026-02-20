#!/bin/bash
. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
unhold_keys
if [ ! -e lockfiletest ]; then
touch lockfiletest
from_strawberry_to_hive
rm lockfiletest
else
unhold_keys
rm lockfiletest
exit_macro
fi

