HOSTNAME=$(hostname)
TIMEZONE=$(cat /etc/timezone)
UTC_SHIFT=$(date +%Z | sed -E 's/([+-])0?([0-9]{1,2})/\1\2/')
OS_INFO=$(lsb_release -d -s)
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime -p)
UPTIME_SECONDS=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I | awk '{print $1}')
MASK=$(ipcalc $IP -b | grep "Netmask:" | awk '{print $2}')
GATEWAY=$(ip r | grep "default" | awk '{print $3}')
RAM_TOTAL_MB=$(free --mega | grep "Mem" | awk '{print $2}')
RAM_TOTAL="$(( $RAM_TOTAL_MB / 1000 )).$(( $RAM_TOTAL_MB % 1000 )) GB"
RAM_USED_MB=$(free --mega | grep "Mem" | awk '{print $3}')
RAM_USED="$(( $RAM_USED_MB / 1000 )).$(( $RAM_USED_MB % 1000 )) GB"
RAM_FREE_MB=$(free --mega | grep "Mem" | awk '{print $4}')
RAM_FREE="$(( $RAM_FREE_MB / 1000 )).$(( $RAM_FREE_MB % 1000 )) GB"
SPACE_ROOT_KB=$(df / | grep "/" | awk '{print $2}')
SPACE_ROOT="$(( $SPACE_ROOT_KB / 1024 )).$(( $SPACE_ROOT_KB % 1024 / 10 )) MB"
SPACE_ROOT_USED_KB=$(df / | grep "/" | awk '{print $3}')
SPACE_ROOT_USED="$(( $SPACE_ROOT_USED_KB / 1024 )).$(( $SPACE_ROOT_USED_KB % 1024 / 10 )) MB"
SPACE_ROOT_FREE_KB=$(df / | grep "/" | awk '{print $4}')
SPACE_ROOT_FREE="$(( $SPACE_ROOT_FREE_KB / 1024 )).$(( $SPACE_ROOT_FREE_KB % 1024 / 10 )) MB"

OUTPUT="HOSTNAME = $HOSTNAME
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

# echo -e "\033[31m${OUTPUT}\033[0m"


RED='\033[31m'
RESET='\033[0m'
while IFS= read -r line; do
    echo -e "${RED}${line}${RESET}"
done <<< "$OUTPUT"
