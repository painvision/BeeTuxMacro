. $MACRO_DIR/stuff/utils.sh
. $MACRO_DIR/stuff/paths.sh
. $MACRO_DIR/config.sh

bash -c $MACRO_DIR/get_loot.sh

go_to_field

if [[ $USE_SPRINKLER == 1 ]]; then
    if [[ ! -f $MACRO_DIR/variables/sprinklers_placed ]]; then
        place_splinker
        touch $MACRO_DIR/variables/sprinklers_placed 2>/dev/null
    fi
fi

bash -c $MACRO_DIR/farm.sh &
bash -c $MACRO_DIR/timer.sh &
bash -c $MACRO_DIR/check_inventory.sh &
