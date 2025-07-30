#!/usr/bin/env bash

# глобальные переменные для использования в main.sh
system_info=""

# функция получения информации о системе
function system_info__get {
    local HOSTNAME=$(hostname)
    local TIMEZONE=$(cat /etc/timezone)
    local UTC_SHIFT=$(date +%Z | sed -E 's/([+-])0?([0-9]{1,2})/\1\2/')
    local OS_INFO=$(lsb_release -d -s)
    local DATE=$(date +"%d %b %Y %T")
    local UPTIME=$(uptime -p)
    local UPTIME_SECONDS=$(cat /proc/uptime | awk '{print $1}')
    local IP=$(hostname -I | awk '{print $1}')
    local MASK=$(ipcalc $IP -b | grep "Netmask:" | awk '{print $2}')
    local GATEWAY=$(ip r | grep "default" | awk '{print $3}')
    local RAM_TOTAL_MB=$(free --mega | grep "Mem" | awk '{print $2}')
    local RAM_TOTAL="$(( $RAM_TOTAL_MB / 1000 )).$(( $RAM_TOTAL_MB % 1000 )) GB"
    local RAM_USED_MB=$(free --mega | grep "Mem" | awk '{print $3}')
    local RAM_USED="$(( $RAM_USED_MB / 1000 )).$(( $RAM_USED_MB % 1000 )) GB"
    local RAM_FREE_MB=$(free --mega | grep "Mem" | awk '{print $4}')
    local RAM_FREE="$(( $RAM_FREE_MB / 1000 )).$(( $RAM_FREE_MB % 1000 )) GB"
    local SPACE_ROOT_KB=$(df / | grep "/" | awk '{print $2}')
    local SPACE_ROOT="$(( $SPACE_ROOT_KB / 1024 )).$(( $SPACE_ROOT_KB % 1024 / 10 )) MB"
    local SPACE_ROOT_USED_KB=$(df / | grep "/" | awk '{print $3}')
    local SPACE_ROOT_USED="$(( $SPACE_ROOT_USED_KB / 1024 )).$(( $SPACE_ROOT_USED_KB % 1024 / 10 )) MB"
    local SPACE_ROOT_FREE_KB=$(df / | grep "/" | awk '{print $4}')
    local SPACE_ROOT_FREE="$(( $SPACE_ROOT_FREE_KB / 1024 )).$(( $SPACE_ROOT_FREE_KB % 1024 / 10 )) MB"

    system_info="HOSTNAME = $HOSTNAME
    TIMEZONE = $TIMEZONE UTC $UTC_SHIFT
    USER = $USER
    OS = $OS_INFO
    DATE = $DATE
    UPTIME = $UPTIME
    UPTIME_SEC = $UPTIME_SECONDS
    IP = $IP
    MASK = $MASK
    GATEWAY = $GATEWAY
    RAM_TOTAL = $RAM_TOTAL
    RAM_USED = $RAM_USED
    RAM_FREE = $RAM_FREE
    SPACE_ROOT = $SPACE_ROOT
    SPACE_ROOT_USED = $SPACE_ROOT_USED
    SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}