# dotfiles

## Installation
### Arch linux

Install aura:
```
https://github.com/fosskers/aura
```
Install requirements
```
aura -A dotdrop pa-notify sway-audio-idle-inhibit-git wdisplays grimshot terminus-font-ttf
pacman -S alacritty sway waybar ttf-font-awesome ttf-roboto rofi-pass wl-clipboard kanshi dunst jq pulsemixer wtype inetutils bash-completion libnotify network-manager-applet gammastep swaylock swayidle xorg-xwayland swaybg
pipx install black-macchiato
```

### Ubuntu

Install requirements:
```
apt-get install sway waybar rofi fonts-terminus-ttf kanshi wdisplays pass swayidle swaylock dunst jq fonts-font-awesome fonts-roboto brightnessctl python grimshot pulsemixer gammastep wtype neovim python3-jedi python3-i3ipc
pipx install dotdrop
pipx install black-macchiato

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
for p in flake8 pylint pydocstyle yamllint ansible-lint rstcheck; do pipx install $p;done
pipx inject pylint pylint_venv
```
Install deoplete compatible code completion:
```
npm install -g ternjs
```
