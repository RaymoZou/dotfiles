# About
Just some of my dots for...
- hyprland
- waybar
- neovim
- tmux

It may be easier to copy and paste each file as needed - otherwise, check out [this](https://news.ycombinator.com/item?id=11071754) Hacker News article on a neat approach to tracking your dots.

## Neovim Config
This is my personal Neovim config that uses Lazy.vim as a package manager. It is currently a work in progress as I try to figure out which plugins I will need and how to configure them for the features I want to have. The general structure of the config consists of external plugins located in `lua/plugins` and their configurations in `after/plugin` with the idea being that all the plugins are configured *after* they are loaded. Neovim packages can be easily added or edited in the `lua` directory and configured in the `after` directory.

### Common Keybinds
| Keys | Actions |
|-----------------|------------------|
| `kj` | Normal mode |
| `Space` + `sg`  | Grep search in Git directory (or current working directory if Git directory not found)|
| `Space` + Space  | Recently opened files |
| `Space` + `pv` | :Ex |
| `Space` + `sf` | Search files in current Git directory |
| `Space` + `sh` | Search help files |
| `Space` + `cs` | List available colorschemes using Telescope |


### Features
- Hyprland dynamic window manager
- Waybar for basic system information such as time, network and battery

### Package Requirements
- `grim` and `slurp` for screenshots

### Neovim Features
- Autocompletion based on source with LSP support
- Telescope.nvim fuzzy finder to navigate directories easily

### Things I Want In The Future
- A plugin that allows me to navigate between buffers easily
