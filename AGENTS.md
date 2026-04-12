# Neovim Configuration

## Project Overview

This is a modern, feature-rich Neovim configuration written in Lua, designed to provide an IDE-like editing experience. It uses lazy.nvim as the plugin manager and includes extensive support for LSP, debugging, AI assistance, Git integration, and more.

The configuration comments use both English and Chinese.

## Technology Stack

- **Editor**: Neovim (requires v0.11+)
- **Language**: Lua
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP**: Native Neovim LSP (vim.lsp)
- **External Dependencies**:
  - Git (for cloning plugins)
  - A Nerd Font (e.g., Hack Nerd Font) for icons
  - `xclip` (Linux) for system clipboard integration
  - `im-select` (macOS, optional) for automatic input method switching
  - `lazygit` (optional) for Git TUI integration

## Project Structure

```
.
├── init.lua                         # Entry point - loads all core modules
├── lazy-lock.json                   # Plugin version lock file (managed by lazy.nvim)
├── README.md                        # Human-readable documentation (English)
├── README.zh.md                     # Chinese documentation
├── TODO                             # Task tracking
└── lua/
    ├── options.lua                  # Vim options/settings
    ├── keymaps.lua                  # Key mappings and shortcuts
    ├── lazynvim-init.lua            # Plugin manager bootstrap
    ├── lsp.lua                      # Native LSP server configurations (Neovim 0.11+)
    ├── colorscheme.lua              # Theme settings
    ├── command.lua                  # Custom user commands
    ├── core/                        # Core utility modules
    │   ├── autocmds.lua             # Autocommands configuration
    │   ├── clang-format-detector.lua # Auto-detect .clang-format for C/C++
    │   └── project-config.lua       # Project-specific .nvim.lua loader
    └── plugins/                     # Individual plugin configuration files
        ├── plugin-avante.lua        # AI chat and code editing (Cursor-like)
        ├── plugin-bufferline.lua    # Buffer tabs
        ├── plugin-catppuccin.lua    # Colorscheme
        ├── plugin-comment.lua       # Code commenting
        ├── plugin-conform.lua       # Code formatting
        ├── plugin-copilot.lua       # GitHub Copilot integration
        ├── plugin-dashboard.lua     # Startup dashboard
        ├── plugin-dap.lua           # Debug Adapter Protocol
        ├── plugin-diffview.lua      # Git diff viewer
        ├── plugin-gitsigns.lua      # Git inline diff
        ├── plugin-im-select.lua     # Input method switching
        ├── plugin-lualine.lua       # Status line
        ├── plugin-markdown-preview.lua
        ├── plugin-mason.lua         # LSP/DAP/formatter installer
        ├── plugin-mason-lspconfig.lua
        ├── plugin-nvim-cmp.lua      # Auto-completion
        ├── plugin-nvim-lspconfig.lua
        ├── plugin-nvim-surround.lua # Surround text manipulation
        ├── plugin-nvim-tree.lua     # File explorer
        ├── plugin-nvim-treesitter.lua
        ├── plugin-outline.lua       # Code outline/symbols
        ├── plugin-render-markdown.lua
        ├── plugin-telescope.lua     # Fuzzy finder
        ├── plugin-toggleterm.lua    # Integrated terminal
        ├── plugin-vimtex.lua        # LaTeX support
        ├── plugin-web-devicons.lua  # File type icons
        └── plugin-which-key.lua     # Key binding hints
```

## Core Modules

### init.lua
Entry point that sequentially requires all core modules:
1. `options` - Basic vim settings
2. `keymaps` - Key bindings
3. `lazynvim-init` - Plugin manager
4. `lsp` - Language server configurations
5. `colorscheme` - Theme
6. `command` - Custom commands
7. `core.autocmds` - Autocommands
8. `core.clang-format-detector` - Auto-detect .clang-format
9. `core.project-config` - Load project-specific config

### lua/options.lua
Vim configuration options:
- Mouse support enabled (`mouse = 'a'`)
- System clipboard integration (`clipboard = 'unnamedplus'`)
- 4-space tabs with expansion (default)
- Line numbers (absolute and relative)
- Cursor line highlighting (only in normal mode and current window)
- Smart search (case-insensitive by default, case-sensitive with uppercase)

### lua/keymaps.lua
Leader key is set to `<Space>`. Key mappings include:

**General:**
- `<LEADER><CR>` - Clear search highlight
- `Q` - Quit
- `<LEADER>bg` - Toggle light/dark theme

**Window Management:**
- `sh`/`sl`/`sj`/`sk` - Split windows
- `<LEADER>h/j/k/l` - Navigate windows
- `Ctrl+Arrow keys` - Resize window

**Tabs:**
- `tn` (new), `tl` (next), `th` (prev), `tc` (close)

**Buffers:**
- `bh`/`bl` - Previous/next buffer
- `bd`/`bq` - Close/force close buffer

**File Tree:**
- `<LEADER>t` - Toggle nvim-tree

**Telescope:**
- `<LEADER>ff` (files), `<LEADER>fg` (grep), `<LEADER>fb` (buffers), `<LEADER>fh` (help)

**LSP:**
- `gd` (definition), `gi` (implementation), `gr` (references)
- `gh` (hover), `<LEADER>F` (format), `<LEADER>r` (rename)
- `<LEADER>ca` (code action), `<LEADER>e` (diagnostic details)
- `<LEADER>tv` (toggle virtual text)
- `<LEADER>a` - Switch between header/source (C/C++)

**Terminal:**
- `<LEADER>tt/tf/tv` - Toggle terminal (horizontal/float/vertical)
- `<C-\>` - Quick toggle terminal
- `<LEADER>tg/tp/tn` - Open lazygit/python/node

**Git:**
- `]c`/`[c` - Next/previous hunk
- `<LEADER>hs/hr/hp/hb` - Stage/reset/preview/blame
- `<LEADER>gd` - Open diff view

**AI:**
- `<LEADER>aa` - Open AI sidebar (Avante)
- `<LEADER>ar/af/ae/ah` - Refresh/focus/edit/ask AI

**Debug:**
- `<LEADER>db/dB` - Toggle/conditional breakpoint
- `<LEADER>dc/dt/dp/dr` - Continue/terminate/pause/restart
- `<LEADER>dj/dk/do` - Step over/into/out
- `<LEADER>du/de` - Toggle UI/evaluate expression

### lua/lsp.lua
Native LSP configuration for Neovim 0.11+ using `vim.lsp.config()` and `vim.lsp.enable()`.

Configured LSP servers:
- **clangd** - C/C++ language server (with `--background-index`)
- **gopls** - Go language server
- **lua_ls** - Lua language server (configured for Neovim/LuaJIT)
- **pylsp** - Python language server

Diagnostic configuration:
- Signs: E (Error), W (Warn), I (Info), H (Hint)
- Virtual text disabled by default (toggleable with `<LEADER>tv`)
- Underline enabled

### lua/core/autocmds.lua
Autocommands configuration:
- Highlight on yank
- Remove trailing whitespace on save
- Return to last edit position when opening files
- Auto-reload file if changed outside
- Resize splits when window is resized
- Close certain filetypes with `q`
- Enable wrap and spell for text filetypes
- LSP attach configuration (document highlight, inlay hints, format on save)
- Terminal settings (no line numbers, auto-insert)
- Auto-create directory when saving file

### lua/core/clang-format-detector.lua
Auto-detects `.clang-format` files and applies indentation settings:
- Supports `BasedOnStyle` presets (Google, LLVM, WebKit, Microsoft, etc.)
- Parses `IndentWidth`, `UseTab`, `TabWidth`
- Applies to `shiftwidth`, `tabstop`, `expandtab`

Commands: `:ClangFormatInfo`, `:SetGoogleStyle`, `:SetLLVMStyle`, etc.

### lua/core/project-config.lua
Loads project-specific configuration from `.nvim.lua` in project root.

### lua/command.lua
Custom user commands:
- `:Format` - Async code formatting via conform.nvim (supports range formatting)

## Plugins

| Plugin | Purpose | Key Bindings |
|--------|---------|--------------|
| lazy.nvim | Plugin manager | `:Lazy` |
| dashboard-nvim | Startup dashboard | `<LEADER>H` |
| catppuccin | Colorscheme (latte/frappe/macchiato/mocha) | `:ThemeToggle` |
| telescope.nvim | Fuzzy finder | `<LEADER>ff/fg/fb/fh` |
| nvim-treesitter | Syntax highlighting | `:TSUpdate` |
| nvim-lspconfig | LSP client configurations | - |
| mason.nvim | LSP/DAP/formatter installer | `:Mason` |
| mason-lspconfig.nvim | Bridge between mason and lspconfig | - |
| nvim-cmp | Auto-completion engine | - |
| nvim-tree.lua | File explorer sidebar | `<LEADER>t` |
| lualine.nvim | Status line | - |
| bufferline.nvim | Buffer tabs | `bh`/`bl`/`bd` |
| conform.nvim | Code formatting | `:Format`, `<LEADER>F` |
| vimtex | LaTeX editing support | - |
| markdown-preview.nvim | Live Markdown preview in browser | `<LEADER>p` |
| render-markdown.nvim | Inline Markdown rendering | `<LEADER>mp` |
| nvim-web-devicons | File type icons | - |
| outline.nvim | Code outline/symbols sidebar | `<LEADER>o` |
| gitsigns.nvim | Git integration (inline diff) | `]c`/`[c`, `<LEADER>hs/hr/hp` |
| diffview.nvim | Git diff viewer | `<LEADER>gd` |
| which-key.nvim | Key binding hints | - |
| Comment.nvim | Code commenting | `gcc`, `gbc`, `gc` (visual) |
| nvim-surround | Surround text manipulation | `ys`, `ds`, `cs` |
| toggleterm.nvim | Integrated terminal | `<LEADER>tt`, `<C-\>` |
| nvim-dap | Debug Adapter Protocol | `<LEADER>db/dc/dt` |
| nvim-dap-ui | Debugging UI | `<LEADER>du` |
| im-select.nvim | Input method switching | - |
| avante.nvim | AI chat and code editing | `<LEADER>aa/ae/ah` |
| copilot.lua | GitHub Copilot integration | `<M-l>`, `<M-]>` |

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
        keys = { ... },              -- Key bindings for lazy loading
        event = "VeryLazy",          -- Lazy loading event
    }
}
```

### Lazy Loading
Lazy.nvim automatically lazy-loads plugins. Some plugins use:
- `cmd` - Load when specific commands are used
- `ft` - Load for specific filetypes
- `event` - Load on specific events (e.g., `VeryLazy`, `VimEnter`)
- `keys` - Load when specific keys are pressed

## Installation

1. Ensure Neovim v0.11+ is installed
2. Clone this repository to `~/.config/nvim` (Linux/macOS) or `%LOCALAPPDATA%\nvim` (Windows)
3. Start Neovim - lazy.nvim will automatically download and install all plugins
4. Install LSP servers via Mason: `:Mason` and select servers to install
5. For clipboard support on Linux: `sudo pacman -S xclip` (Arch) or equivalent
6. For Markdown preview: The plugin will auto-install its dependencies on first use
7. For im-select (macOS): `brew install im-select`
8. For Copilot: Run `:Copilot auth` in Neovim

## Maintenance Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open lazy.nvim plugin manager UI |
| `:Mason` | Open Mason LSP/DAP/formatter installer |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Sync plugins (install/remove/update) |
| `:checkhealth lazy` | Check lazy.nvim health |
| `:checkhealth mason` | Check Mason health |
| `:checkhealth lsp` | Check LSP health |
| `:TSUpdate` | Update treesitter parsers |
| `:Format` | Format current buffer |
| `:ThemeToggle` | Toggle between light and dark theme |
| `:Theme {light/dark}` | Set specific theme |

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

### Input Method Switching (macOS)
Requires `im-select` to be installed:
```bash
brew tap daipeihust/tap
brew install im-select
```

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

## Project-Specific Configuration

Create `.nvim.lua` in project root for project-specific settings:

```lua
-- .nvim.lua
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
```

## Security Considerations

- The configuration loads `.nvim.lua` from project root - review before opening untrusted projects
- AI plugins (avante.nvim, copilot.lua) require API keys and send code to external services
- Mason installs external binaries - ensure you trust the sources

## Notes for AI Agents

- This configuration uses lazy.nvim's module-based plugin loading - each file in `lua/plugins/` is automatically discovered
- The `lazy-lock.json` file should be committed to version control to ensure reproducible plugin versions
- When adding new LSP servers, add configuration in `lua/lsp.lua`
- When adding new plugins, create a new file in `lua/plugins/` following the existing naming convention
- Keymaps should be added to `lua/keymaps.lua` for consistency
- Custom commands should be added to `lua/command.lua`
- Autocommands should be added to `lua/core/autocmds.lua`
- The configuration requires Neovim 0.11+ for native LSP configuration
