#!/usr/bin/env bash

# функция валидирует номера цветов из конфига
function params_validation__get_flag {
    local validation_flag=0

    # использую ссылку на массив, чтобы наглядно передавать переменную из другого файла
    # в функкцию для лучшей читаемости
    local -n used_colors_nums=$1

    local colors_keys=(
        "column1_background"
        "column1_font_color"
        "column2_background"
        "column2_font_color"
    )

    # проверка на ввод цифр от 1 до 6
    for key in "${colors_keys[@]}"; do
        if [[ ! "${used_colors_nums[$key]}" =~ ^[1-6]$ ]]; then
            (( validation_flag++ ))
        fi
    done

    bg_fg_pairs=(
        "column1_background column1_font_color"
        "column2_background column2_font_color"
    )
    
    # проверка на совпадение цветов текста и фона
    for pair in "${bg_fg_pairs[@]}"; do
        read -r bg fg <<< "$pair"
        if [[ "${used_colors_nums[$bg]}" == "${used_colors_nums[$fg]}" ]]; then
            (( validation_flag++ ))
        fi
    done

    return $validation_flag
}

