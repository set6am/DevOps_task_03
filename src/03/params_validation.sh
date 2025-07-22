
function params_validation {

    local -n nums_of_params=$1
    local -n input_params=$2
    local -n param1=$3
    local -n param2=$4
    local -n param3=$5
    local -n param4=$6
    

    local VALIDATION_FLAG=0
    if [ $nums_of_params -ne 4 ]; then
        (( VALIDATION_FLAG++ ))
    fi

    for param in "${input_params[@]}"; do
        if [[ ! $param =~ ^[1-6]$ ]]; then
            (( VALIDATION_FLAG++ ))
        fi
    done

    if [[ $param1 -eq $param2 || $param3 -eq $param4 ]]; then
        (( VALIDATION_FLAG++ ))
    fi

    return $VALIDATION_FLAG
}