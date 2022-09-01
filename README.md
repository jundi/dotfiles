# dotfiles

## Installation
### Arch linux

Install requirements
```
aurget -S dotdrop pa-notify sway-audio-idle-inhibit-git
pacman -S alacritty sway waybar otf-font-awesome ttf-roboto rofi wl-clipboard kanshi dunst jq pulsemixer
pip install black-macchiato
```

### Ubuntu

Install requirements:
```
apt-get install sway waybar rofi fonts-terminus xfonts-terminus kanshi wdisplays pass swayidle swaylock dunst jq fonts-font-awesome fonts-roboto brightnessctl wl-clipboard python3-virtualenv slurp
pip install --user dotdrop pulsemixer black-macchiato
apt-get install cargo
cargo install alacritty
```
Manually install requirements that are not available from software repositories:

- https://github.com/ikrivosheev/pa-notify
- https://raw.githubusercontent.com/carnager/rofi-pass
- https://github.com/ErikReider/SwayAudioIdleInhibit
- https://github.com/swaywm/sway/blob/master/contrib/grimshot

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
