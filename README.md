# .dotfiles

## Install

OS dependencies by running `install_xxx.sh`.

Then

```
git clone https://github.com/afridlund85/.dotfiles.git ~/.dotfiles && \
cd ~/.dotfiles && \
make
```

Start nvim and run `:PackerSync`

or

Open plugins and save it (ctrl + w)

```
nvim nvim/.config/nvim/lua/afridlund85/plugins.lua
```

Packer install sometimes fails, just run again.

## Dev

### Ubuntu

```
docker build -t dotfiles_ubuntu_dev -f ./Dockerfile-ubuntu-dev .
docker run --rm -it --name dotfiles_ubuntu_dev -u 1001:1001 dotfiles_ubuntu_dev /bin/bash
```
