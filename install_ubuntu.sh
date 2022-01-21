#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_16.x | bash
add-apt-repository ppa:neovim-ppa/stable
apt update
apt install -y software-properties-common neovim stow \
    nodejs \
    php8.1-{bcmath,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

curl -OL https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
tar -C /usr/local -xvf go1.17.7.linux-amd64.tar.gz
rm go1.17.7.linux-amd64.tar.gz 

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mkdir -p ~/.local/bin
mv composer.phar ~/local/bin/composer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

stow git
stow nvim
stow bash

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim

# LSP
/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
npm i -g typescript typescript-language-server
npm i -g @tailwindcss/language-server
npm i -g vscode-langservers-extracted
npm i -g intelephense
npm i -g @fsouza/prettierd

# font
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/"Roboto Mono Nerd Font Complete.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
curl -fLo ~/.local/share/fonts/"Droid Sans Mono Nerd Font Complete.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Nvim
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +PlugInstall +qall

