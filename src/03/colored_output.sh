
function output_colored_system_info {
    local -n result_array=$1
    local -n output_system_info=$2

    while IFS= read -r line; do
        KEY=$(echo "$line" | awk -F" = " '{print $1}')
        VALUE=$(echo "$line" | awk -F" = " '{print $2}')
        # echo -e "\033[3${partsList[0]}m\033[4${$partsList[1]}m$KEY\033[0m\033[0m"
        echo -e -n "\033[3${result_array[0]};4${result_array[1]}m$KEY\033[0m"
        echo -n " = "
        echo -e "\033[3${result_array[2]};4${result_array[3]}m$VALUE\033[0m"
        # echo ${partsList[1]}
    done <<< "$output_system_info"
}