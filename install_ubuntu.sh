#!/bin/bash

sudo add-apt-repository ppa:ondrej/php -y && \
sudo apt -qq update && \
sudo apt -qq -y install curl wget git build-essential software-properties-common gnupg2 g++ cmake stow zip unzip \
	ripgrep \
	fd-find \
	yamllint \
	shellcheck \
    php8.0-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} \
    php8.1-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} \
    php8.2-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

