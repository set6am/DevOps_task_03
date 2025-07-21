#!/bin/bash

input_list_params=("$@")
. ./system_info.sh
. ./color_set.sh

. ./params_validation.sh
params_validation $# $@ $1 $2 $3 $4

. ./colored_output.sh

if [ $VALIDATION_FLAG -eq 0 ]; then
    get_colors_from_params input_list_params colorsList partsList 

    output_colored_system_info $partsList $OUTPUT
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


