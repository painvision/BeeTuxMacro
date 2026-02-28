#!/bin/bash

. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh

unhold_keys

if [ ! -e lockfiletest ]; then
    touch lockfiletest
    from_hive_to_honey_wreath_and_back
    rm lockfiletest
else
    unhold_keys
    rm lockfiletest
    exit_macro
fi

