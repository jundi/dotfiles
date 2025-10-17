# dotfiles

## Installation
### Arch linux

Install aura:
```
https://github.com/fosskers/aura
```
Install requirements
```
aura -A dotdrop sway-audio-idle-inhibit-git wdisplays grimshot terminus-font-ttf pasystray-wayland
pacman -S alacritty sway waybar ttf-font-awesome ttf-roboto rofi-pass wl-clipboard kanshi dunst jq pulsemixer wtype inetutils bash-completion libnotify network-manager-applet gammastep swaylock swayidle xorg-xwayland swaybg
pipx install black-macchiato
```

### Ubuntu

Install requirements:
```
apt-get install sway waybar rofi alacritty dotdrop neovim fonts-terminus kanshi swaylock dunst jq wdisplays grimshot wtype isort pasystray swayidle pulsemixer gammastep brightnessctl fonts-font-awesome fonts-roboto firefox python3-jedi python3-i3ipc pass ranger
pipx install black-macchiato

```
Manually install requirements that are not available from software repositories:
- https://github.com/ikrivosheev/pa-notify
- https://raw.githubusercontent.com/carnager/rofi-pass
- https://github.com/ErikReider/SwayAudioIdleInhibit

Install ALE compatible linters:
```
apt-get install chktex lacheck eslint libxml2-utils ansible-lint yamllint
pipx install rstcheck
```
Install deoplete compatible code completion:
```
npm install -g ternjs
```
Install lscolors
```
wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
```
