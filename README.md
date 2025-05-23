# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Stow

```
sudo pacman -S stow
```
### Git

```
sudo pacman -S git
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:LowLevelProgrammer/dotfiles.git
$ cd dotfiles
```

## Usage

You can stow the config for any individual app using the following command

```
cd ~/dotfiles
stow <directory-name-for-corresponding-app>
```

For each app you need to make sure you have installed app specific requirements first

## Index
- [Zsh](#zsh)
- [Neovim](#neovim)
- [Tmux](#tmux)

### Zsh

For zsh make sure you have installed zsh and set it as your accounts default shell

```
sudo pacman -S zsh
```

To set zsh as your default shell, first check the location of your zsh
```
which zsh # generally /bin/zsh
```
change the shell for you account
```
chsh <user-account-name>
New shell[/bin/bash]: /bin/zsh # or the result which zsh
```
Finally stow the zsh config
```
cd ~/dotfiles
stow zshrc
```
Then open a terminal session and follow through the zsh setup prompt

### Neovim

#### Requirements

```
sudo pacman -S nvim
```
For good measure install pip (included in python package), npm (included with nodejs) as well as other tools unzip, ripgrep etc. 
```
sudo pacman -S python nodejs unzip ripgrep
```
Now stow neovim config
```
cd ~/dotfiles
stow nvim
```
Open neovim and let lazy install all the plugins from the config file (**Note**: If you encounter any errors related to missing dependencies while installing plugins via Lazy in Neovim, simply install the required dependencies on your system and restart neovim.)

Then to install LSPs, formatters and linters
```
# Open neovim
nvim

# Type the following command
:MasonInstallAll
```

### Tmux

#### Requirements

Install tmux
```
sudo pacman -S tmux
```
Then install tpm (the package manager for tmux)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Setup

Stow tmux config
```
cd ~/dotfiles
stow tmux
```

Start a tmux session
```
tmux

# If already in a tmux session then source the new tmux config
tmux source ~/.config/tmux/tmux.conf
```

Install the plugins using `<leader> + I` while inside a tmux session

 The new leader key is **Ctrl+Space** (while default tmux leader is Ctrl+b)
