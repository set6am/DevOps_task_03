#!/bin/bash

params_num=4
par1=$(cat color_set.cfg | grep "column1_background" | awk -F"=" '{print $2}')
par2=$(cat color_set.cfg | grep "column1_font_color" | awk -F"=" '{print $2}')
par3=$(cat color_set.cfg | grep "column2_background" | awk -F"=" '{print $2}')
par4=$(cat color_set.cfg | grep "column2_font_color" | awk -F"=" '{print $2}')

input_list_params=("$par1" "$par2" "$par3" "$par4")

. ./system_info.sh
. ./color_set.sh

. ./params_validation.sh
params_validation input_list_params par1 par2 par3 par4
validation_flag=$?

. ./colored_output.sh

if [ $validation_flag -eq 0 ]; then
    get_colors_from_params input_list_params colors_list parts_list 

    output_colored_system_info parts_list OUTPUT
else
    echo "Некорректный ввод параметров. 

Вызовите скрипт повторно, указав 4 параметра: 
каждый параметр это цифра от 1 до 6, обозначающая цвет
(1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)

Параметр 1 — это фон названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 2 — это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 3 — это фон значений (после знака '=').
Параметр 4 — это цвет шрифта значений (после знака '=').

Убедитесь, что цвет шрифта и фона не совпадают."
fi

# if [[ $# -eq 4 && $1 =~ ^[1-6]$ && $2 =~ ^[1-6]$ && $3 =~ ^[1-6]$ && $4 =~ ^[1-6]$ ]]; then
#     if [[ $1 -ne $2 && $3 -ne $4 ]]; then
        
#     else
#         echo "Фон и цвет текста не должны совпадать. 
# Вы можете вызвать скрипт повторно, указав разные значения цветов для фона и шрифта."
#     fi
# else

# fi


