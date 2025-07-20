WHITE='7'
RED='1'
GREEN='2'
BLUE='4'
PURPLE='5'
BLACK='0'

colorsList=(0 $WHITE $RED $GREEN $BLUE $PURPLE $BLACK)
partsList=()


function get_colors_from_params {
    for param in $@; do
        partsList+=(${colorsList[$param]})
    done
}