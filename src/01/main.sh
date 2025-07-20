#!/bin/bash

. ./check_input.sh

if [ $# -eq 1 ]; then
    check_input "$1"
else
    echo "Необходимо задать один аргумент"
fi

