# Worthant's dotfiles

OS: Fedora Linux Workstation 38  
Tiling VM: Sway  
Terminal: Kitty  
Shell: fish  
Editor: Neovim  

## Dotfiles repo config

1. Clone repo, for example into `~/dev`
2. Just add symbolic links for each needed module:

```bash
ln -s ~/dev/dotfiles/sway ~/.config/sway
```

- The structure should look like this:

```
~/.config
├── sway -> ~/dotfiles/sway
├── rofi -> ~/dotfiles/rofi
├── waybar -> ~/dotfiles/waybar
├── fish -> ~/dotfiles/fish
└── nvim -> ~/dotfiles/nvim
```

## TODO:

- [ ] Waybar
  - [ ] Fix icon for RAM usage
  - [ ] Customize everything to my liking
  - [ ] Try rounded corners
  - [ ] Think about system color theme - cattpucin or something
- [ ] Sway
  - [ ] Control for mx 3s mouse?
  - [ ] I want some theme picker logic to stop editing paths manually and see instant results
  - [ ] Make rounded corners for tiles
  - [ ] Play with transparency
  - [ ] Network management?
    - [x] nmcli
    - [ ] other gui?
  - [x] Bluetooth management?
    - [x] `blueman-manager`
    - [ ] Create a script for instant auto-connection to my xm4 heaphones
  - [x] Audio management?
    - [x] `PulseAudio`
    - [ ] Add support for changing the volume using the wheel on my keyboard
  - [x] Dark theme system-wide (GTK)
    - [x] use lxappearance
    - [x] install arc-theme
    - [x] set prefer dark theme to 1 in `~/.config/gtk-3.0/settings.ini` and `~/.gtkrc-2.0`
  - [ ] Add shortcuts 
    - [ ] for "Files"
    - [ ] for Discord
    - [ ] for Telegram
    - [ ] think about the utility, like in neovim, to show all the shortcuts, or just create a docs
    - [ ] Unify shortcut map, some of them are so uncomfy :(
  - [ ] When i come home - add flexible setup for all 3 monitors
  - [ ] add flexible setup for having either 1 laptop monitor, or 1 27" work monitor
  - [ ] Check if everything works
    - [x] Discord
    - [ ] Zoom
    - [x] OBS
    - [ ] Telegram call
    - [ ] Microsoft Teams
    - [x] Google call
- [ ] Kitty
  - [ ] Tweak theme colors to make it more readable (~too dark rn)
  - [ ] Add small padding
- [ ] Nvim
  - [ ] Merge `base` & `user` configs into monolithic config
  - [ ] Create a separate repo for mantaining merged config
  - [ ] Add here as a submodule

- [ ] Integrate add-ons [from here](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)
