#!/usr/bin/env bash

# глобальные переменные для использования в main.sh
selected_colors_code=() # код цветов, выбранных ранее
selected_colors_name=() # название цветов, выбранных ранее

# функция получения аттрибутов выбранных цветов
function colors_attrs__get {
    local WHITE='7'
    local RED='1'
    local GREEN='2'
    local BLUE='4'
    local PURPLE='5'
    local BLACK='0'

    local colors_code=(0 $WHITE $RED $GREEN $BLUE $PURPLE $BLACK)
    local colors_name=(0 "white" "red" "green" "blue" "purple" "black")

    local colors_keys=(
        "column1_background"
        "column1_font_color"
        "column2_background"
        "column2_font_color"
    )

    # использую ссылку на массив, чтобы наглядно передавать переменную из другого файла
    # в функкцию для лучшей читаемости
    local -n used_colors_nums=$1

    for key in "${colors_keys[@]}"; do
        selected_colors_code+=("${colors_code["${used_colors_nums[$key]}"]}")
        selected_colors_name+=("${colors_name["${used_colors_nums[$key]}"]}")
    done
}

function colors_attrs__output {
    local -n default_colors_flag=$1
    local -n used_colors_nums=$2

    if [[ default_colors_flag -eq 1 ]]; then
        echo "Column 1 background = default (${selected_colors_name[0]})"
        echo "Column 1 font color = default (${selected_colors_name[1]})"
        echo "Column 2 background = default (${selected_colors_name[2]})"
        echo "Column 2 font color = default (${selected_colors_name[3]})"
    else
        echo "Column 1 background = ${used_colors_nums[column1_background]} (${selected_colors_name[0]})"
        echo "Column 1 font color = ${used_colors_nums[column1_font_color]} (${selected_colors_name[1]})"
        echo "Column 2 background = ${used_colors_nums[column2_background]} (${selected_colors_name[2]})"
        echo "Column 2 font color = ${used_colors_nums[column2_font_color]} (${selected_colors_name[3]})"
    fi
}