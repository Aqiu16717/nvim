# Neovim Configuration

## Project Overview

This is a personal Neovim configuration written in Lua. It provides a modern IDE-like editing experience with LSP support, fuzzy finding, file tree navigation, auto-completion, syntax highlighting, and more.

## Technology Stack

- **Editor**: Neovim (requires v0.9+)
- **Language**: Lua
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **External Dependencies**: 
  - Git (for cloning plugins)
  - A Nerd Font (e.g., Hack Nerd Font) for icons
  - `xclip` (Linux) for system clipboard integration

## Project Structure

```
.
├── init.lua              # Entry point - loads all core modules
├── lazy-lock.json        # Plugin version lock file (managed by lazy.nvim)
├── README.md             # Human-readable documentation
├── TODO                  # Task tracking
└── lua/
    ├── options.lua       # Vim options/settings (mouse, tabs, UI, search)
    ├── keymaps.lua       # Key mappings and shortcuts
    ├── lazynvim-init.lua # Plugin manager bootstrap and initialization
    ├── lsp.lua           # LSP server configurations
    ├── colorscheme.lua   # Theme settings
    ├── command.lua       # Custom user commands
    └── plugins/          # Individual plugin configuration files
        ├── plugin-catppuccin.lua
        ├── plugin-telescope.lua
        ├── plugin-nvim-treesitter.lua
        ├── plugin-nvim-lspconfig.lua
        ├── plugin-mason.lua
        ├── plugin-mason-lspconfig.lua
        ├── plugin-nvim-cmp.lua
        ├── plugin-nvim-tree.lua
        ├── plugin-lualine.lua
        ├── plugin-bufferline.lua
        ├── plugin-conform.lua
        ├── plugin-vimtex.lua
        ├── plugin-markdown-preview.lua
        ├── plugin-web-devicons.lua
        └── plugin-outline.lua
```

## Core Modules

### init.lua
The entry point that sequentially requires all core modules:
1. `options` - Basic vim settings
2. `keymaps` - Key bindings
3. `lazynvim-init` - Plugin manager
4. `lsp` - Language server configurations
5. `colorscheme` - Theme
6. `command` - Custom commands

### lua/options.lua
Vim configuration options:
- Mouse support enabled
- System clipboard integration (`unnamedplus`)
- 4-space tabs with expansion
- Line numbers (absolute and relative)
- Cursor line highlighting
- Smart search (case-insensitive by default, case-sensitive with uppercase)

### lua/keymaps.lua
Leader key is set to `<Space>`. Key mappings include:
- `<LEADER><CR>` - Clear search highlight
- `Q` - Quit
- Window splitting: `sh` (left), `sl` (right), `sj` (down), `sk` (up)
- Window navigation: `<LEADER>h/j/k/l`
- Window resize: `Ctrl+Arrow keys`
- Tabs: `tn` (new), `tl` (next), `th` (prev), `tc` (close)
- File tree: `<LEADER>t` - Toggle nvim-tree
- Markdown preview: `<LEADER>p` - Toggle preview
- Telescope: `<LEADER>ff` (files), `<LEADER>fg` (grep), `<LEADER>fb` (buffers), `<LEADER>fh` (help)
- LSP: `gd` (definition), `gi` (implementation), `gr` (references), `gh` (hover), `<LEADER>F` (format), `<LEADER>r` (rename), `<LEADER>ca` (code action)

### lua/lsp.lua
Configured LSP servers:
- **clangd** - C/C++ language server
- **gopls** - Go language server
- **lua_ls** - Lua language server (configured for Neovim/LuaJIT)
- **pylsp** - Python language server

### lua/lazynvim-init.lua
Bootstraps lazy.nvim plugin manager:
- Automatically clones lazy.nvim if not present
- Loads all plugin specs from `lua/plugins/` directory

### lua/colorscheme.lua
Sets the colorscheme to `catppuccin-latte` (light variant).

### lua/command.lua
Custom user commands:
- `:Format` - Async code formatting via conform.nvim (supports range formatting)

## Plugins

| Plugin | Purpose |
|--------|---------|
| catppuccin | Colorscheme with multiple variants (latte, frappe, macchiato, mocha) |
| telescope.nvim | Fuzzy finder for files, grep, buffers, help tags |
| nvim-treesitter | Advanced syntax highlighting and code parsing |
| nvim-lspconfig | LSP client configurations |
| mason.nvim | Package manager for LSP servers, DAP servers, linters, and formatters |
| mason-lspconfig.nvim | Bridge between mason and lspconfig |
| nvim-cmp | Auto-completion engine with LSP, buffer, and path sources |
| nvim-tree.lua | File explorer sidebar |
| lualine.nvim | Status line at bottom |
| bufferline.nvim | Buffer tabs at top |
| conform.nvim | Code formatting (configured for clang-format) |
| vimtex | LaTeX editing support |
| markdown-preview.nvim | Live Markdown preview in browser |
| nvim-web-devicons | File type icons |
| outline.nvim | Code outline/symbols sidebar |

## Configuration Conventions

### Plugin File Structure
Each plugin configuration file returns a Lua table with the plugin specification:

```lua
return {
    {
        "author/plugin-name",
        dependencies = { ... },      -- Optional dependencies
        version = "*",               -- Optional version pinning
        config = function()          -- Optional config function
            require("plugin").setup({ ... })
        end,
        opts = { ... },              -- Alternative to config for simple setups
        init = function() end,       -- For pre-setup configuration
    }
}
```

### Lazy Loading
Lazy.nvim automatically lazy-loads plugins. Some plugins use:
- `cmd` - Load when specific commands are used
- `ft` - Load for specific filetypes
- `event` - Load on specific events

## Installation

1. Ensure Neovim v0.9+ is installed
2. Clone this repository to `~/.config/nvim` (Linux/macOS) or `%LOCALAPPDATA%\nvim` (Windows)
3. Start Neovim - lazy.nvim will automatically download and install all plugins
4. Install LSP servers via Mason: `:Mason` and select servers to install
5. For clipboard support on Linux: `sudo pacman -S xclip` (Arch) or equivalent
6. For Markdown preview: The plugin will auto-install its dependencies on first use

## Maintenance Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open lazy.nvim plugin manager UI |
| `:Mason` | Open Mason LSP/DAP/formatter installer |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Sync plugins (install/remove/update) |
| `:checkhealth lazy` | Check lazy.nvim health |
| `:checkhealth mason` | Check Mason health |
| `:TSUpdate` | Update treesitter parsers |
| `:Format` | Format current buffer |

## Troubleshooting

### Clipboard Issues
If clipboard integration doesn't work, ensure:
- `xclip` is installed on Linux
- `vim.opt.clipboard = 'unnamedplus'` is set (in `options.lua`)

### Font Issues
For proper icon display:
1. Install a Nerd Font (e.g., Hack Nerd Font)
2. Configure your terminal to use the Nerd Font

### LSP Not Working
1. Check LSP is installed: `:Mason` → verify server is installed
2. Check LSP health: `:checkhealth lsp`
3. Check for errors with `:LspLog`

## External System Configuration

### Keyboard Mapping (Optional)
For better Vim experience, remap Caps Lock to Escape at system level:

```bash
# Edit system profile
sudo nvim /etc/profile

# Add this line to remap Caps Lock to Escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Source the profile
source /etc/profile
```

## Notes for AI Agents

- This configuration uses lazy.nvim's module-based plugin loading - each file in `lua/plugins/` is automatically discovered
- The `lazy-lock.json` file should be committed to version control to ensure reproducible plugin versions
- When adding new LSP servers, add configuration in `lua/lsp.lua`
- When adding new plugins, create a new file in `lua/plugins/` following the existing naming convention
- Keymaps should be added to `lua/keymaps.lua` for consistency
- Custom commands should be added to `lua/command.lua`
- The configuration comments use a mix of English and Chinese
