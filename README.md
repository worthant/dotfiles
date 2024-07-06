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
  - [ ] Make rounded corners for tiles
  - [ ] Play with transparency
  - [ ] Network management?
  - [ ] Add shortcut for "Files"
  - [ ] When i come home - add flaxible setup for all 3 monitors
  - [ ] add flexible setup for having either 1 laptop monitor, or 1 27" work monitor
  - [ ] Unify shortcut map, some of them are so uncomfy :(
  - [ ] Add support for changing the volume using the wheel on my keyboard
  - [ ] Check if everything works
    - [ ] Discord
    - [ ] Zoom
    - [x] OBS
    - [ ] Telegram call
    - [ ] Microsoft Teams
    - [ ] Google call
- [ ] Kitty
  - [ ] Add small padding
- [ ] Nvim
  - [ ] Merge `base` & `user` configs into monolithic config
  - [ ] Create a separate repo for mantaining merged config
  - [ ] Add here as a submodule
