.DEFAULT_GOAL := all
.PHONY: all stow nvim nvm node go composer rust sdkman java lua luarocks maven

all: stow tmux nvim nvm node go composer 

stow:
	mkdir -p ~/.config
	stow git
	stow nvim
	stow lazy
	stow bash
	stow tmux

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

nvim:
	curl -fsSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo tar -C /opt -xf nvim-linux64.tar.gz
	ln -s /opt/nvim-linux64/bin/nvim ~/.local/bin/nvim
	rm nvim-linux64.tar.gz

.ONESHELL:
export XDG_CONFIG_HOME=${HOME}/.config
nvm:
	mkdir -p ${HOME}/.config/nvm
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

.ONESHELL:
SHELL := /bin/bash
export NVM_DIR=${HOME}/.config/nvm
node:
	\. ${NVM_DIR}/nvm.sh
	nvm install --lts

go:
	curl -OL https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
	sudo tar -C /usr/local/ -xf go1.22.5.linux-amd64.tar.gz
	rm go1.22.5.linux-amd64.tar.gz

composer:
	wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
	mkdir -p ~/.local/bin
	mv composer.phar ~/.local/bin/composer

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
	curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
	chmod +x ~/.local/bin/rust-analyzer

sdkman:
	curl -s "https://get.sdkman.io" | bash
	. ~/.sdkman/bin/sdkman-init.sh -s

lua:
	wget http://www.lua.org/ftp/lua-5.4.6.tar.gz
	tar zxf lua-5.4.6.tar.gz
	cd lua-5.4.6
	make all test
	sudo make install
	cd ..
	rm lua-5.4.6.tar.gz
	rm -rf lua-5.4.6

luarocks:
	wget https://luarocks.github.io/luarocks/releases/luarocks-3.9.2.tar.gz
	tar zxf luarocks-3.9.2.tar.gz
	cd luarocks-3.9.2
	./configure --with-lua-include=/usr/local/include
	make
	sudo make install
	cd ..
	rm luarocks-3.9.2.tar.gz
	sudo rm -rf luarocks-3.9.2

.ONESHELL:
SHELL := /bin/bash
java:
	\. ${HOME}/.sdkman/bin/sdkman-init.sh
	sdk install java

.ONESHELL:
SHELL := /bin/bash
maven:
	\. ${HOME}/.sdkman/bin/sdkman-init.sh
	sdk install maven

# lsp: ~/.nodejs /usr/local/go/bin/go
# 	/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
# 	curl -OL https://github.com/sumneko/lua-language-server/releases/download/3.5.3/lua-language-server-3.5.3-linux-x64.tar.gz
# 	sudo mkdir -p /usr/local/lua-language-server
# 	sudo tar -C /usr/local/lua-language-server/ -xf lua-language-server-3.5.3-linux-x64.tar.gz
# 	rm lua-language-server-3.5.3-linux-x64.tar.gz
	# ~/.nodejs/bin/npm i -g yarn
	# ~/.nodejs/bin/npm i -g tree-sitter-cli
	# ~/.nodejs/bin/npm i -g typescript typescript-language-server
	# ~/.nodejs/bin/npm i -g @tailwindcss/language-server
	# ~/.nodejs/bin/npm i -g vscode-langservers-extracted
	# ~/.nodejs/bin/npm i -g intelephense
	# ~/.nodejs/bin/npm i -g @fsouza/prettierd
	# ~/.nodejs/bin/npm i -g dockerfile-language-server-nodejs
	# ~/.nodejs/bin/npm i -g yaml-language-server
