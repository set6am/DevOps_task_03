#!/usr/bin/env bash

# глобальные переменные для использования в main.sh
declare -A color_cfg_dict
default_colors=0

# функция переноса записей cfg файла в словарь (ассоциативный массив)
function cfg_colors__convert_to_dict {
    while IFS='=' read -r key value; do
        color_cfg_dict["$key"]=$value
    done < color_set.cfg
}

# валидация на пустые значения в конфиге
function cfg_colors__check_empty_values {
    for value in "${color_cfg_dict[@]}"; do
        if [[ -z "$value" ]]; then
            color_cfg_dict[column1_background]=6 # black
            color_cfg_dict[column1_font_color]=1 # white
            color_cfg_dict[column2_background]=2 # red
            color_cfg_dict[column2_font_color]=4 # blue

            default_colors=1
            break
        fi
    done
}

