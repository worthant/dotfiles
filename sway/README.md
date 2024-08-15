# This is my Sway FX config

## Mappings

> `mod` == `super`  
> `leader` == `space`

### Navigation

| Action                         | Mappings                |
| ------------------------------ | ----------------------- |
| Focusing tiles                 | `mod + h/j/k/l`         |
| Moving tiles                   | `mod + shift + h/j/k/l` |
| Stacking layout                | `mod + s`               |
| Tabbed layout                  | `mod + w`               |
| Split layout                   | `mod + e`               |
| Floating mode                  | `mod + shift + leader`  |
| Full screen                    | `mod + f`               |
| Toggle windows in stack layout | `f3`                    |

### UX

| Action                   | Mappings                                      |
| ------------------------ | --------------------------------------------- |
| Launch any application   | `mod+d`                                       |
| Kill window              | `cntrl+q`                                     |
| Screenshot (fullscreen)  | `cntrl+shift+del`                             |
| Screenshot (area)        | `shift+del`                                   |
| Change us/ru locales     | `capslock`                                    |
| Toggle obs recording     | `cntrl + shift + o`                           |
| Change volume on kb knob | `XF86AudioRaiseVolume (XF86AudioLowerVolume)` |
| Reload sway config file  | `mod+shift+c`                                 |
| Exit sway                | `cntrl+alt+del`                               |

### Startup shortcuts

| Action   | Mappings |
| -------- | -------- |
| Terminal | `alt+t`  |
| Firefox  | `alt+f`  |

### Workspaces

I have 10 basic workspaces and 9 custom dedicated for their purpose

| Action                          | Mappings    |
| ------------------------------- | ----------- |
| Switch between basic workspaces | `alt+[0-9]` |
| Audio                           | `mod+alt+a` |
| Music                           | `mod+alt+m` |
| Jupyter notebook                | `mod+alt+j` |
| Telegram                        | `mod+alt+t` |
| Network                         | `mod+alt+n` |
| Obs                             | `mod+alt+o` |
| Discord                         | `mod+alt+d` |
| Games                           | `mod+alt+g` |
| Learning                        | `mod+alt+l` |

> [!NOTE]  
> To move container to any of them, just add shift after mod

## Packages required for a smooth experience

- kitty terminal
- Sway FX (not just Sway) (rounded corners)
- Fedora >= 39
- grim (for screenshots)
- obs-cmd (for recording)
- rofi (application launcher)
