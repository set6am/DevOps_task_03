
function check_input {
if [[ "$1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
	echo "Incorrect input"
else
	echo "$1"
fi
}

