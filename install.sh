#!/bin/sh
#
# This script installs all the tools I like on top of a normal Ubuntu box.
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/install.sh)"
# or wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/install.sh)"
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

install_base_packages() {
    apt-get install -y wget curl vim git zip bzip2 fontconfig python g++ libpng-dev build-essential software-properties-common
}

install_jdk() {
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    apt-get install -y adoptopenjdk-11-hotspot
}

install_nodejs() {
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install -g npm
}

automatic_updates() {
    apt-get update
    apt-get --with-new-pkgs upgrade -y
    apt-get install -y unattended-upgrades
}

clean_up() {
    apt autoremove -y
    reboot
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
    
    install_base_packages

    install_jdk

    install_nodejs

    automatic_updates

    clean_up

    printf "$BLUE"
	cat <<-'EOF'
    Congratulations, setup is complete!
	EOF
	printf "$RESET"
}

main "$@"