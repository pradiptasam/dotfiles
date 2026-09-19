# herdr keymap

Prefix is `ctrl+a` (same as tmux). `prefix+x` means: press `ctrl+a`, release, press `x`.
`prefix+?` shows every active binding live; `/` filters the list.
Config: `~/dotfiles/.config/herdr/config.toml` (symlinked to `~/.config/herdr/config.toml`).
Apply edits with `prefix+r` or `herdr server reload-config`.

Concept map from tmux: session -> herdr server, **workspace (space)** -> new level, one per
project, window -> **tab**, pane -> pane.

## Panes

| Key | Action |
|---|---|
| `prefix+.` | split side by side (tmux `prefix .`) |
| `prefix+-` | split stacked (tmux `prefix -`) |
| `ctrl+h/j/k/l` | move between panes, and between nvim splits inside nvim (vim-herdr-navigation) |
| `ctrl+alt+h/j/k/l` | move between panes, fallback that ignores nvim |
| `prefix+h/j/k/l` | resize pane one step in that direction |
| `prefix+shift+r` | resize mode, then `h/j/k/l` repeatedly, `esc` to leave |
| `prefix+m` | zoom / unzoom the pane (tmux `prefix m`) |
| `prefix+x` | close pane |
| `prefix+shift+h/j/k/l` | swap pane with its neighbour |
| `prefix+tab` / `prefix+shift+tab` | cycle panes |
| `prefix+space` | cycle layouts: even-v, even-h, main-left, main-top, tiled (unzoom first) |
| `prefix+shift+e` | equalize panes into columns |
| `prefix+shift+p` | rename pane |

## Tabs (tmux windows)

| Key | Action |
|---|---|
| `prefix+c` | new tab, asks for a name |
| `prefix+n` / `prefix+p` | next / previous tab |
| `prefix+1..9` | jump to tab N |
| `prefix+shift+t` | rename tab |
| `prefix+shift+x` | close tab |

## Workspaces (spaces)

| Key | Action |
|---|---|
| `prefix+shift+n` | new workspace in the current pane's directory |
| `prefix+w` | workspace picker: `up/down` move, `1..9` jump to workspace N, `enter` focus, `esc` cancel |
| `prefix+g` | goto picker: fuzzy search across workspaces, tabs, panes, agents |
| `prefix+(` / `prefix+)` | previous / next workspace |
| `prefix+alt+1..9` | jump to workspace N (left option key only; unreliable in WezTerm, prefer `prefix+w` then digit) |
| `prefix+shift+w` | rename workspace |
| `prefix+shift+d` | close workspace |
| `prefix+shift+g` | create a git worktree of this workspace and open it as a new workspace |
| `prefix+b` | toggle the sidebar |

## Copy and scrollback

| Key | Action |
|---|---|
| `prefix+[` | copy mode, vi keys: `h/j/k/l`, `w/b/e`, `ctrl+u/ctrl+d`, `/` and `?` search, `n/N` repeat, `v` select, `y` copy, `q` leave |
| `prefix+e` | open the pane scrollback in `$EDITOR` |
| `prefix+f` | tiny-fingers: hint labels on paths, URLs, hashes; type a hint to copy, `tab` multi-select, `esc` leave |
| mouse drag | selects without copying; `ctrl+c` or `cmd+c` copies (`copy_on_select = false`) |

## Tools

| Key | Action |
|---|---|
| `prefix+shift+f` | floax: toggle the persistent floating shell for this workspace (80%) |
| `prefix+u` | lazygit in a floating popup (85%); `q` closes |
| `prefix+shift+u` | lazygit plugin in its own tab; `U` toggles sidebar / expanded layout, `C` AI commit message |
| `prefix+y` | yazi file manager in a floating popup; `enter` opens in nvim |
| `prefix+t` | file viewer tree in a split; `f` fuzzy-find, `e` edit in nvim, `v` cycle view, `]`/`[` next/prev changed file, `?` help |
| `prefix+i` | reviewr diff review overlay; `c` comment on a line, `?` keys, press again to close |

## Session

| Key | Action |
|---|---|
| `prefix+q` | detach, everything keeps running (`herdr` reattaches) |
| `prefix+r` | reload config (tmux `prefix r`) |
| `prefix+s` | settings |
| `prefix+?` | keybinding help |
| `prefix+o` | jump to the pane behind the current notification |

Shell: `herdr` attaches and restores layout after a reboot; `herdr server stop` ends everything;
`herdr update` upgrades with live pane handoff.

## Shell side effects

`ctrl+l` (clear) and `ctrl+k` (kill line) are taken by pane navigation in non-vim panes, as with
vim-tmux-navigator. Type `clear` instead of `ctrl+l`. If it hurts, move the navigation keys to
`alt+h/j/k/l` in both the herdr config and the nvim.lua the plugin ships.

## Terminal notes (WezTerm, QWERTZ)

- WezTerm sends shifted digits as characters, so shift+digit bindings are avoided.
- Alt is the left option key; the right one composes characters.
- `ctrl+g` is taken system-wide by Grammarly.
- `enable_kitty_keyboard = true` in wezterm.lua would make shift and ctrl+alt chords fully reliable; not enabled.

## Plugins installed

vim-herdr-navigation, herdr-lazygit, herdr-floax, herdr-pane-layouts (id `layouts`),
herdr-tiny-fingers, herdr-reviewr (id `persiyanov.reviewr`), herdr-file-viewer.
`herdr plugin list`, `herdr plugin action list`, `herdr plugin log list --plugin <id>`.
Plugin configs: `~/.config/herdr/plugins/config/<id>/`.
Not installed: herdr-tmux-layout (needs Go).
