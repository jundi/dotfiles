# dotfiles

## Installation
### Arch linux

Install requirements
```
aurget -S dotdrop pa-notify sway-audio-idle-inhibit-git
pacman -S alacritty sway waybar otf-font-awesome ttf-roboto rofi wl-clipboard kanshi dunst jq pulsemixer wtype
pip install black-macchiato
```

### Ubuntu

Install requirements:
```
apt-get install sway waybar rofi fonts-terminus-otb kanshi wdisplays pass swayidle swaylock dunst jq fonts-font-awesome fonts-roboto brightnessctl python grimshot pulsemixer gammastep wtype neovim
pip install --user dotdrop black-macchiato

Install alacritty:
apt-get install cargo cmake g++ pkg-config libfontconfig-dev
cargo install alacritty
```
Manually install requirements that are not available from software repositories:

- https://github.com/ikrivosheev/pa-notify
- https://raw.githubusercontent.com/carnager/rofi-pass
- https://github.com/ErikReider/SwayAudioIdleInhibit

Install ALE compatible linters:
```
apt-get install chktex lacheck eslint libxml2-utils
pip install --user flake8 pylint pydocstyle yamllint ansible-lint rstcheck pylint_venv
```
Install deoplete compatible code completion:
```
pip install --user jedi
npm install -g ternjs
```
