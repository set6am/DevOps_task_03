WHITE='7'
RED='1'
GREEN='2'
BLUE='4'
PURPLE='5'
BLACK='0'

colors_list=(0 $WHITE $RED $GREEN $BLUE $PURPLE $BLACK)
parts_list=()


function get_colors_from_params {
    local -n input_params=$1
    local -n color_map=$2
    local -n result_array=$3

    for param in "${input_params[@]}"; do
        result_array+=("${color_map[$param]}")
    done
}