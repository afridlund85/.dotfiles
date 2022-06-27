# .dotfiles

## Install

### Ubuntu

```
sudo apt update -qq && \
sudo apt install -qq -y git && \
git clone https://github.com/afridlund85/.dotfiles.git ~/.dotfiles && \
cd ~/.dotfiles && \
sudo ./install_ubuntu.sh
```

Start nvim and run `:PackerSync`

or

Open plugins and save it (ctrl + w)

```
nvim nvim/.config/nvim/lua/afridlund85/plugins.lua
```

## Dev

### Ubuntu

```
docker build -t dotfiles_ubuntu -f ./Dockerfile-ubuntu .
docker run --rm -it --name dotfiles_ubuntu_dev -u 1001:1001 dotfiles_ubuntu /bin/bash
```
