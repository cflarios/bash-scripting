#!/bin/bash

msg=$(cat << "EOF"
                                    ','. '. ; : ,','
                                      '..'.,',..'
                                         ';.'  ,'
                                          ;;
                                          ;'
                            :._   _.------------.___
                    __      :__:-'                  '--.
             __   ,' .'    .'             ______________'.
           /__ '.-  _\___.'          0  .' .'  .'  _.-_.'
              '._                     .-': .' _.' _.'_.'
                 '----'._____________.'_'._:_:_.-'--'
EOF
)

printf "\n\e[1;94m$msg\e[0m\n\n"

sleep 1

# OS detection
if [ -f /etc/lsb-release ]; then
    # Debian, Ubuntu, Linux Mint
    PACKAGE_MANAGER="apt"
    printf "🐧 Detected operating system: \e[1;32m$(lsb_release -is)\e[0m\n\n"
elif [ -f /etc/redhat-release ]; then
    # Red Hat, CentOS, Fedora
    PACKAGE_MANAGER="dnf"
    printf "🐧 Detected operating system: \e[1;32m$(cat /etc/redhat-release)\e[0m\n\n"
else
    echo "❌ This operating system is not supported."
    exit 1
fi


printf "📦 Updating repositories and installing dependencies... \n\n"

# Check if update is needed
sudo $PACKAGE_MANAGER update > /dev/null 2>&1
updates=$(sudo $PACKAGE_MANAGER list --upgradable 2>/dev/null | grep -c upgradable)

update(){
    sudo $PACKAGE_MANAGER update
    sudo $PACKAGE_MANAGER install -y apt-transport-https ca-certificates curl software-properties-common
    printf "\n\n✅ Done."
}

if [ "$PACKAGE_MANAGER" = "apt" ]; then
    if [ $updates -eq 0 ]; then
        printf "    ✅ The repositories have already been updated."
        else
        update
    fi
    elif [ "$PACKAGE_MANAGER" = "dnf" ]; then
        if [ $updates -eq 0 ]; then
            printf "    ✅ The repositories have already been updated."
            else
            update
        fi
fi

# Install Docker : https://github.com/docker/docker-install
printf "\n\n🐋 Installing Docker...\n\n"

if command -v docker &>/dev/null; then
    IS_DOCKER_INSTALLED=true
    printf "    ✅ Docker is already installed. \n\n"
    else
    IS_DOCKER_INSTALLED=false
    sudo apt update
    wget https://get.docker.com/ && sudo mv index.html install_docker.sh
    sudo chmod +x install_docker.sh
    sudo ./install_docker.sh
    printf "\n\n✅ Done.\n\n"
    sudo rm install_docker.sh
fi

# Add the current user to the "docker" group to execute Docker commands without sudo

if groups $USER | grep &>/dev/null '\bdocker\b'; then
    printf "    ✅ The current user is already in the \"docker\" group.\n\n"
    else
    printf "🐋 Adding the current user to the \"docker\" group..."
    sudo usermod -aG docker $USER
    sleep 1
    printf "✅ Done.\n\n"
    printf "⚠️  \e[1;33mWARNING:\e[0m You may need to restart the session or system to apply the changes.\n\n"
fi

# Instalall Docker Compose

if command -v docker-compose &>/dev/null; then
    IS_DOCKER_COMPOSE_INSTALLED=true
    printf "    ✅ Docker Compose is already installed. \n\n"
    else
    IS_DOCKER_COMPOSE_INSTALLED=false
    printf "🐋 Installing Docker Compose... \n\n"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sleep 1
    printf "\n\n✅ Done.\n\n"
fi

# Show Docker and Docker Compose versions
printf "🐋 Docker version: " 
docker --version \n\n
printf "\n🐋 Docker Compose version: " 
docker-compose --version

# Show final message
if [ "$IS_DOCKER_INSTALLED" = true ] && [ "$IS_DOCKER_COMPOSE_INSTALLED" = true ]; then
    printf "\n📢 Docker and Docker Compose were already installed.\n\n"
    elif [ "$IS_DOCKER_INSTALLED" = true ] && [ "$IS_DOCKER_COMPOSE_INSTALLED" = false ]; then
    printf "\n📢 Docker was already installed.\n\n"
    elif [ "$IS_DOCKER_INSTALLED" = false ] && [ "$IS_DOCKER_COMPOSE_INSTALLED" = true ]; then
    printf "\n📢 Docker Compose was already installed.\n\n"
    else
    printf "\n📢 Docker and Docker Compose have been successfully installed.\n\n"
fi
