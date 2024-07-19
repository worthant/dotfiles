# Worthant's dotfiles

OS: Fedora Linux Workstation 39  
Tiling VM: SwayFX  
Terminal: Kitty  
Shell: fish  
Editor: Neovim

| ![image_2024-07-11_20-01-57](https://github.com/worthant/dotfiles/assets/43885024/65a2b51a-b5ad-471d-bb3b-83701a4bc0e4) |
| ----------------------------------------------------------------------------------------------------------------------- |
| ![image_2024-07-11_20-01-56](https://github.com/worthant/dotfiles/assets/43885024/081b2b68-10c5-4c2f-9a7e-4133b4539726) |

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

- [ ] Fish
  - [ ] Change theme to provide clear space for commands input (takes too much
        space when have long repo/dir names)
- [ ] Waybar
  - [ ] !Add a box with current locale (us/ru)
  - [ ] I want some theme picker logic to stop editing paths manually and see
        instant results
  - [ ] Add weather
    - [ ] Fix script for custom feather
    - [ ] Add weather for Mestia
    - [ ] Add weather for Tbilisi
    - [ ] Add weather for Saint-Petersburg
  - [ ] Network
    - [ ] Fix the autoconnection to wifi (ethernet first!)
    - [ ] other network manager than `nmcli`?
  - [ ] Add OBS box (insane feaure)
  - [ ] Add shortcuts
    - [ ] for "Files"
    - [ ] for Discord
    - [ ] for Telegram
    - [ ] think about the utility, like in neovim, to show all the shortcuts, or
          just create a docs
    - [ ] Unify shortcut map, some of them are so uncomfy :(
  - [ ] When i come home - add flexible setup for all 3 monitors
  - [ ] add flexible setup for having either 1 laptop monitor, or 1 27" work
        monitor
  - [x] Add config for sway/workspaces
    - [x] add Names for dedicated workspaces
    - [ ] add scrolling using keyboard, not only mouse
  - [ ] Customize everything to my liking
    - [x] Kind of (25%)
    - [x] Very good (50%)
    - [x] VERY good (75%)
    - [x] VERY GOOD (90%)
    - [ ] FUCKING INSANE (95%)
    - [ ] GOD TIER
  - [x] Apply
        [this insane waybar](https://www.reddit.com/r/unixporn/comments/19csv7m/sway_fedora_sway_rice_new_wave_loving_this/)
  - [x] Try rounded corners
  - [x] Do i really need to show cpu box?
    - [x] No, i think you don't, because ryzen 7 5800h is too powerful
  - [x] Add IP to network box
  - [x] Tweak color theme to the more bright one
    - [x] Use hex color picker for this
  - [x] Change time format to 24h
  - [x] Add Custom clocks for both GE & NYC locales, with date in the middle
- [ ] Sway
  - [x] Add more workspaces
    - [x] Make them dedicated (OBS, Telegram, e.t.c.)
  - [x] Control for mx 3s mouse?
    - [x] yes, use `Solaar`
  - [x] Make rounded corners for tiles
  - [x] Add blur and shadows
  - [x] Play with transparency
  - [x] Mouse Management? (Logitech MX master 3s)
    - [x] `solaar`
  - [x] Bluetooth management?
    - [x] `blueman-manager`
    - [ ] Create a script for instant auto-connection to my xm4 heaphones
  - [x] Audio management?
    - [x] `PulseAudio`
    - [ ] Add support for changing the volume using the wheel on my keyboard
  - [x] Dark theme system-wide (GTK)
    - [x] use lxappearance
    - [x] install arc-theme
    - [x] set prefer dark theme to 1 in `~/.config/gtk-3.0/settings.ini` and
          `~/.gtkrc-2.0`
  - [ ] Check if everything works
    - [x] Discord
      - [x] Check screen sharing (works only in browser)
    - [x] Zoom
      - [x] Check screen sharing (everything works firt couple touches, then
            can't use panels)
    - [x] OBS
      - [x] Check screen sharing (works perfectly smooth)
      - [x] Use `obs-cli` to automate some things in sway config
    - [ ] Telegram call
    - [ ] Microsoft Teams
    - [x] Google call
      - [x] Check screen sharing (works perfectly)
- [x] Kitty
  - [x] Tweak theme colors to make it more readable (~too dark rn)
  - [x] Add small padding
- [ ] Nvim
  - [x] Merge `base` & `user` configs into monolithic config
  - [x] Create a separate repo for mantaining merged config
  - [ ] Add here as a submodule
- [ ] Integrate add-ons
      [from here](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)

## Groundbreaking features

- [x] Migrate to `SwayFX`
  - [x] Add rounded, fucking, borders :tada:
- [ ] Interactive waybar widget for obs recording status
  - i have a very cool waybar, which has boxes for each widget. i want to add a
    box, that will show up if the obs is currently running and show the status
    of the recording - like, if i press a button, the recording starts and i can
    clearly see it
