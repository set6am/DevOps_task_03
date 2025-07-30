#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# ---------ОПИСАНИЕ СКРИПТА---------
# скрипт для вывода информации об операционной системе
# для кастомизации цветов загляни в color_set.cfg
# каждый параметр это цифра от 1 до 6, обозначающая цвет
# (1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)

# Параметр 1 — это фон названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
# Параметр 2 — это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
# Параметр 3 — это фон значений (после знака '=').
# Параметр 4 — это цвет шрифта значений (после знака '=').

# Убедитесь, что цвет шрифта и фона не совпадают.

# При оставлении пустым хотя бы одного из цветов 
# используется цветовая схема по умолчанию:
# column1 background = black
# column1 font color = white
# column2 background = red
# column2 font color = blue
# ---------ОПИСАНИЕ СКРИПТА---------


# получаем цвета из конфига и проверяем все ли цвета указаны
. ./cfg_colors.sh
# глобальные переменные:
# - color_cfg_dict (ассоциативный массив, содержит данные из color_set.cfg)
# - default_colors (флаг, показывающий используются ли дефолтные значения цветов)
cfg_colors__convert_to_dict
cfg_colors__check_empty_values

# получаем информацию о системе
. ./system_info.sh
# глобальные переменные:
# - system_info (строковая переменная содержащая информацию о системе)
system_info__get

# получаем аттрибуты выбранных цетов (номер, имя, код)
. ./color_attrs.sh
# глобальные переменные:
# - selected_colors_code (код цветов, выбранных ранее)
# - selected_colors_name (название цветов, выбранных ранее)

# валидируем номера цветов из конфига
. ./params_validation.sh
params_validation__get_flag color_cfg_dict
validation_flag=$?

# красим и выводим в терминал системную информацию
. ./colored_output.sh

if [ $validation_flag -eq 0 ]; then
    color_attrs__get color_cfg_dict
    colored_output__system_info selected_colors_code system_info
    color_attrs__output default_colors color_cfg_dict
else
    echo "Некорректный ввод параметров в конфигурацию. 

Вызовите скрипт повторно, указав в конфигурации 4 параметра: 
каждый параметр это цифра от 1 до 6, обозначающая цвет
(1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)

Параметр 1 — это фон названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 2 — это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 3 — это фон значений (после знака '=').
Параметр 4 — это цвет шрифта значений (после знака '=').

Убедитесь, что цвет шрифта и фона не совпадают."
fi


