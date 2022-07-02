#!/bin/bash

apt -qq update
apt -qq -y install curl wget git

curl -fsSL https://deb.nodesource.com/setup_16.x | bash
apt -qq update
apt -qq -y install build-essential software-properties-common g++ cmake stow \
	ripgrep \
	fd-find \
    nodejs \
    php8.1-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

ln -s $(which fdfind) ~/.local/bin/fd

curl -fsSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
apt install -qq -y ./nvim-linux64.deb
rm nvim-linux64.deb

curl -OL https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
tar -C /usr/local -xf go1.17.7.linux-amd64.tar.gz
rm go1.17.7.linux-amd64.tar.gz 

wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
mkdir -p ~/.local/bin && mv composer.phar ~/.local/bin/composer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

stow git
stow nvim
stow bash

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim

# LSP
/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
npm i -g yarn
npm i -g tree-sitter-cli
npm i -g typescript typescript-language-server
npm i -g @tailwindcss/language-server
npm i -g vscode-langservers-extracted
npm i -g intelephense
npm i -g @fsouza/prettierd
npm i -g dockerfile-language-server-nodejs
yarn global add yaml-language-server

# font
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/"Roboto Mono Nerd Font Complete.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
curl -fLo ~/.local/share/fonts/"Droid Sans Mono Nerd Font Complete.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Nvim
# Currently not working properly: https://github.com/wbthomason/packer.nvim/issues/897
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
