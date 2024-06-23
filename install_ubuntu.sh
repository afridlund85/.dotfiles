#!/bin/bash

sudo add-apt-repository ppa:ondrej/php -y && \
sudo apt -qq update && \
sudo apt -qq -y install curl wget git ca-certificates build-essential software-properties-common gnupg2 g++ cmake stow zip unzip \
    ripgrep \
    fd-find \
    yamllint \
    shellcheck \
    tmux \
    inotify-tools \
    php8.3-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi,yaml,redis,xdebug} \
    lua5.4 luarocks \
    python3-venv python3-pip

mkdir -p ~/.local/bin
ln -s "$(which fdfind)" ~/.local/bin/fd

pip install debugpy
pip install virtualenv

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/RobotoMonoNerdFont-Regular.ttf https://github.com/ryanoasis/nerd-fonts/raw/v3.1.1/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf
curl -fLo ~/.local/share/fonts/DroidSansMNerdFont-Regular.otf https://github.com/ryanoasis/nerd-fonts/raw/v3.1.1/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf

#docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -qq update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
