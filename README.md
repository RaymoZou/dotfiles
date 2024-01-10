# Neovim Config
This is my personal Neovim config that uses Lazy.vim as a package manager. It is currently a work in progress as I try to figure out which plugins I will need and how to configure them for the features I want to have. The general structure of the config conists of external plugins located in `lua/plugins` and their configurations in `after/plugin` with the idea being that all the plugins are configured *after* they are loaded.

## Features
- Tokyonight color theme
- Autocompletion based on sourced with LSP support
- Telescope.nvim fuzzy finder to navigate directories easily

## Things I Want In The Future
- A way to sync the current Netrw directory with the current working directory
- Plugin to visualize and operate git commands (this would probably be fugitive.nvim?)
