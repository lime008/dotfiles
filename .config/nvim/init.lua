--[[
Neovim configuration written in lua.
Creator: lime008
--]]

-- General configuration
require("set")

-- Plugins
require("plugins")

-- Nvim lsp config
require("lsp-config")

-- Code formatters
require("formatters")

-- Completions configuration
require("completions")

--[[

Other configuration files:

Configurations that depend on plugins are loaded from the "./after/plugin/"
directory.

airline.lua:	airline specific configuration. Colors etc.
colors.lua:		vim colorscheme and tweaks to it.
keymap.lua:		kustom key mappings for different things.
				Easier to lookup when they are collected to a single file.
nvim-tree.lua:	Nvim-tree specific configurations and keymaps specific only to
				the nvim-tree buffers.

--]]
