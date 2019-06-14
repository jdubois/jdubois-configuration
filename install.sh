#!/bin/sh
#
# This script installs all the tools I like on top of a normal Ubuntu box.
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/tools/install.sh)"
# or wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/tools/install.sh)"
#
setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

main() {

	setup_color

	printf "$BLUE"
	cat <<-'EOF'
   _     _       _           _     _                        __ _                       _   _             
  (_)   | |     | |         (_)   ( )                      / _(_)                     | | (_)            
   _  __| |_   _| |__   ___  _ ___|/ ___    ___ ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __  
  | |/ _` | | | | '_ \ / _ \| / __| / __|  / __/ _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \ 
  | | (_| | |_| | |_) | (_) | \__ \ \__ \ | (_| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | |
  | |\__,_|\__,_|_.__/ \___/|_|___/ |___/  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
 _/ |                                                             __/ |                                  
|__/                                                             |___/                                   

                --> https://github.com/jdubois/jdubois-configuration/install.sh <--
	EOF
	printf "$RESET"


}

main "$@"