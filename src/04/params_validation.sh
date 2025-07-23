
function params_validation {

    local -n input_params=$1
    local -n param1=$2
    local -n param2=$3
    local -n param3=$4
    local -n param4=$5
    

    local VALIDATION_FLAG=0

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