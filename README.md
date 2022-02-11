# dotfiles

## Installation

### Ubuntu

Install requirements:
```
apt-get install sway waybar rofi fonts-terminus xfonts-terminus kanshi wdisplays pass swayidle swaylock dunst jq fonts-font-awesome fonts-roboto brightnessctl wl-clipboard python3-virtualenv
pipinstall --user dotdrop pulsemixer yapf
apt-get install cargo
cargo install alacritty
```
pa-notify must be compiled: https://github.com/ikrivosheev/pa-notify

Install ALE compatible linters:
```
apt-get install chktex lacheck eslint
pip install --user flake8 pylint pydocstyle yamllint ansible-lint rstcheck
```
Install deoplete compatible code completion:
```
pip install --user jedi
npm install -g ternjs
```
