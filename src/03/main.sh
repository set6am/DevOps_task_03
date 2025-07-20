#!/bin/bash

. ./system_info.sh

WHITE='7'
RED='1'
GREEN='2'
BLUE='4'
PURPLE='5'
BLACK='0'

colorsList=(0 $WHITE $RED $GREEN $BLUE $PURPLE $BLACK)
partsList=()

VALIDATION_FLAG=0
if [ $# -ne 4 ]; then
    VALIDATION_FLAG+=1
fi

for param in $@; do
    if [[ ! $param =~ ^[1-6]$ ]]; then
        VALIDATION_FLAG+=1
    fi
done

if [[ $1 -eq $2 || $3 -eq $4 ]]; then
    VALIDATION_FLAG+=1
fi

if [ $VALIDATION_FLAG -eq 0 ]; then
    for param in $@; do
        partsList+=(${colorsList[$param]})
    done

    while IFS= read -r line; do
        KEY=$(echo "$line" | awk -F" = " '{print $1}')
        VALUE=$(echo "$line" | awk -F" = " '{print $2}')
        # echo -e "\033[3${partsList[0]}m\033[4${$partsList[1]}m$KEY\033[0m\033[0m"
        echo -e -n "\033[3${partsList[0]};4${partsList[1]}m$KEY\033[0m"
        echo -n " = "
        echo -e "\033[3${partsList[2]};4${partsList[3]}m$VALUE\033[0m"
        # echo ${partsList[1]}
    done <<< "$OUTPUT"
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


