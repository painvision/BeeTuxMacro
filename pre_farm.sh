. ~/BeeTuxMacro/stuff/utils.sh
. ~/BeeTuxMacro/stuff/paths.sh
. ~/BeeTuxMacro/config.sh

bash -c ~/BeeTuxMacro/get_loot.sh

go_to_field

if [[ $USE_SPRINKLER == 1 ]]; then
    if [[ ! -f ~/BeeTuxMacro/variables/sprinklers_placed ]]; then
        place_splinker
        touch ~/BeeTuxMacro/variables/sprinklers_placed 2>/dev/null
    fi
fi

bash -c ~/BeeTuxMacro/farm.sh &
bash -c ~/BeeTuxMacro/timer.sh &
bash -c ~/BeeTuxMacro/check_inventory.sh &
