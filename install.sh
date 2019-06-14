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

install-base-packages() {
    apt-get install -y wget curl vim git zip bzip2 fontconfig python g++ libpng-dev build-essential software-properties-common
}

install-jdk() {
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    apt-get install -y adoptopenjdk-11-hotspot
}

install-nodejs() {
    wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.gz -O /tmp/node.tar.gz
    tar -C /usr/local --strip-components 1 -xzf /tmp/node.tar.gz
    npm install -g npm
}

install-jhipster() {
    npm install -g yo generator-jhipster
}

setup-workspace() {
    mkdir /home/julien/workspace
    chown -R julien:julien /home/julien/workspace
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
    
    install-base-packages

    install-jdk

    install-nodejs

    install-jhipster

    setup-workspace

    printf "$BLUE"
	cat <<-'EOF'
    Congratulations, setup is complete!
	EOF
	printf "$RESET"
}

main "$@"