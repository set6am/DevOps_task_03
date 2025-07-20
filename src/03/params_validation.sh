
function params_validation {
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
}