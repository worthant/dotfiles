# Worthant's dotfiles

OS: Fedora Linux Workstation 39  
Tiling VM: SwayFX  
Terminal: Kitty  
Shell: fish (`lambda` theme from `oh-my-fish`)  
Editor: Neovim (`Cattpucin` theme)

| ![image](https://github.com/user-attachments/assets/6fb2ce13-e8b2-4492-addc-6d9ae40ead2c) |
| ----------------------------------------------------------------------------------------- |
| ![image](https://github.com/user-attachments/assets/b328100b-04f5-41b1-bc7a-056f3edb5a79) |
| ![image](https://github.com/user-attachments/assets/c85a6d8c-7a0a-4449-bd3f-25087f14752f) |
| ![image](https://github.com/user-attachments/assets/06657062-04c1-4d3f-9241-fc1d024c0c37) |
| ![image](https://github.com/user-attachments/assets/2025ba3a-54cb-4b21-af8e-fe83094e89b4) |
| ![image](https://github.com/user-attachments/assets/bff85183-cf49-4825-a348-51ee59a4e6d9) |

## Dotfiles repo config

1. Clone repo, for example into `~/dev`
2. Just add symbolic links for each needed module:

```bash
ln -s ~/dev/dotfiles/sway ~/.config/sway
```

- The structure should look like this:

```bash
~/.config
├── sway -> ~/dotfiles/sway
├── rofi -> ~/dotfiles/rofi
├── waybar -> ~/dotfiles/waybar
├── fish -> ~/dotfiles/fish
├── chrome -> ~/.mozilla/firefox/XXXXXXX.default-XXXXXXX/
└── nvim -> ~/dotfiles/nvim
```

## TODO:

- [ ] Fish
  - [x] Change theme to provide clear space for commands input (takes too much
        space when have long repo/dir names)
- [ ] Waybar
  - [x] !Add a box with current locale (us/ru)
  - [x] I want some theme picker logic to stop editing paths manually and see
        instant results
  - [ ] Add weather
    - [ ] Fix script for custom feather
    - [ ] Add weather for Mestia
    - [ ] Add weather for Tbilisi
    - [ ] Add weather for Saint-Petersburg
  - [ ] Network
    - [x] Fix the autoconnection to wifi (ethernet first!)
    - [ ] other network manager than `nmcli`?
      - [ ] Add
            [this](https://github.com/zbaylin/rofi-wifi-menu?tab=readme-ov-file)
      - [x] Add `nmtui` with desktop entry
      - [ ] Or try setting up nm-applet for network manager
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
    - [x] FUCKING INSANE (95%)
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
  - [ ] Try adding rounded borders - white / purple / neon blue - see the
        results
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
    - [x] Add support for changing the volume using the wheel on my keyboard
  - [x] Dark theme system-wide (GTK)
    - [x] use lxappearance
    - [x] install arc-theme
    - [x] set prefer dark theme to 1 in `~/.config/gtk-3.0/settings.ini` and
          `~/.gtkrc-2.0`
  - [ ] Check if everything works
    - [x] Discord
      - [x] Check screen sharing (works only in browser)
      - [x] Find a solution: use `Datcord` client from Flatpack, it works inside
            Firefox, whichsolves problem with screensharing, and also gives
            ability to zoom using scrolling
    - [x] Zoom
      - [x] Check screen sharing (everything works first couple touches, then
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
- [x] Nvim
  - [x] Merge `base` & `user` configs into monolithic config
  - [x] Create a separate repo for mantaining merged config
  - [x] Add here as a submodule
- [ ] Integrate add-ons
      [from here](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)

## Groundbreaking features

- [ ] Flexible screens support
  - [ ] Figure out why the wallpaper select feature isn't working sometimes when
        monitors are switched between home and work)
  - [ ] Make/use some utility for discovering & using & configuring multiple
        inputs, like from proector, different monitors, camera e.t.c.
- [x] Migrate to `SwayFX`
  - [x] Add rounded, fucking, borders :tada:
- [ ] Interactive waybar widget for obs recording status
  - i have a very cool waybar, which has boxes for each widget. i want to add a
    box, that will show up if the obs is currently running and show the status
    of the recording - like, if i press a button, the recording starts and i can
    clearly see it
- [ ] Keyboard screencast. So that i can record a video of what i'm doing.
  - should be catched with obs probably

## List of software for good UX

- `Neovim` (main **IDE** for everything)
- `Bluetooth manager` (manage bluetooth devices)
- `PulseAudio Volume Control` (audio mixer)
- `Cassette` (non-official yandex music client)
- `Solaar` (control logitech devices (for me - mx3 mouse))
- `nmcli` (control network via terminal)
- `NM TUI` (NetworkManager TUI - better than nmcli)
- `brightnessctl` (control brightness via terminal)
- `Kdenlive` (video montage)
- `Darktable` (photo coloring & editing)
- `TeX Live` - full package for LaTeX preview in `neovim`
- `pgAdmin` (monitor / work with Postgres databases)
- `Postman` (Test APIs)
- `Obs` (record / stream)
- `obs-cmd` (control obs)
  - (websockets control for obs across the system)
  - install [here](https://github.com/grigio/obs-cmd)
- `Jupyter` (work with python interactively)
  - `Desktop`
  - `Lab`
  - `jupyter-lsp`
  - `jedi lsp server`
  - continious hinting (advanced settings)
- `Datcord` (an unofficial Linux Discord client, runs inside Firefox, which
  solves screensharing problems)
- `Telegram`
- `Firefox & Chromium`
- `Software` (GNOME thingie, handy to install from GUI)
- **For git**:
  - `lazygit` in neovim
  - `Sublime merge` for soy devs (free & lightweight & goot git graph)
- osu!
  - `Lazer`
  - `OpenTabletDriver`
- `chafa` (cli command to preview images inside terminal)
  - Usage: `chafa image.png`
