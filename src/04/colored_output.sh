#!/usr/bin/env bash

# функция красит текст и выводит в консоль
function colored_output__system_info {
    local -n color_codes=$1
    local -n system_info_data=$2

    local color_fg1="3${color_codes[1]}"
    local color_bg1="4${color_codes[0]}"
    local color_fg2="3${color_codes[3]}"
    local color_bg2="4${color_codes[2]}"
    local reset="\033[0m"

    while IFS=' = ' read -r KEY VALUE; do
        echo -e -n "\033[${color_fg1};${color_bg1}m$KEY${reset}"
        echo -n " = "
        echo -e "\033[${color_fg2};${color_bg2}m$VALUE${reset}"
    done <<< "$system_info_data"
}