# Neovim Configuration

<p align="center">
  <b>Modern Neovim Configuration with Lua</b><br>
  <a href="README.zh.md">中文版本</a>
</p>

---

## 🚀 Overview

A modern, feature-rich Neovim configuration providing an IDE-like editing experience with:
- 🔍 Fuzzy file finder and grep
- 🌲 File explorer sidebar
- ✨ Auto-completion with LSP support
- 🎨 Beautiful colorschemes with auto light/dark mode
- 📊 Status line and buffer tabs
- 📝 Live Markdown preview
- 📑 Code outline/symbols
- 🎯 Code formatting
- 🔀 Git integration with inline diff
- ❓ Key binding hints with which-key
- 💬 Quick code commenting
- 🔄 Surround text manipulation

## 📋 Requirements

- Neovim >= 0.11
- Git (for cloning plugins)
- [Nerd Font](https://www.nerdfonts.com/) (for icons, e.g., Hack Nerd Font)
- `xclip` (Linux, for system clipboard)
- `im-select` (Optional, for automatic input method switching on macOS)

## 📦 Installation

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone <your-repo-url> ~/.config/nvim

# Start Neovim (plugins will be auto-installed)
nvim

# Install LSP servers
:Mason
```

## 📁 Directory Structure

```
.
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin lock file
├── lua/
│   ├── core/
│   │   └── autocmds.lua  # Autocommands
│   ├── options.lua       # Vim options/settings
│   ├── keymaps.lua       # Key mappings
│   ├── lazynvim-init.lua # Plugin manager bootstrap
│   ├── lsp.lua           # Native LSP configurations
│   ├── colorscheme.lua   # Theme settings
│   ├── command.lua       # Custom commands
│   └── plugins/          # Plugin configurations
│       ├── plugin-catppuccin.lua
│       ├── plugin-telescope.lua
│       ├── plugin-nvim-treesitter.lua
│       ├── plugin-nvim-lspconfig.lua
│       ├── plugin-mason.lua
│       ├── plugin-nvim-cmp.lua
│       ├── plugin-nvim-tree.lua
│       ├── plugin-lualine.lua
│       ├── plugin-bufferline.lua
│       ├── plugin-conform.lua
│       └── ...
└── README.md
```

## ⌨️ Key Mappings

**Leader key:** `<Space>`

### General
| Key | Action |
|-----|--------|
| `Q` | Quit |
| `<LEADER><CR>` | Clear search highlight |
| `<LEADER>bg` | Toggle light/dark theme |

### Window Management
| Key | Action |
|-----|--------|
| `sh` / `sl` | Split left / right |
| `sj` / `sk` | Split down / up |
| `<LEADER>h/j/k/l` | Navigate windows |
| `Ctrl+Arrow` | Resize window |

### Tabs
| Key | Action |
|-----|--------|
| `tn` | New tab |
| `tl` / `th` | Next / previous tab |
| `tc` | Close tab |
### Buffer (Bufferline)
| Key | Action |
|-----|--------|
| `bh` | Previous buffer |
| `bl` | Next buffer |
| `bd` | Close current buffer |
| `bq` | Force close buffer |

### File Explorer (nvim-tree)

#### Basic Operations
| Key | Action |
|-----|--------|
| `<LEADER>t` | Toggle file tree |
| `q` | Close file tree |
| `?` | Show help (all keymaps) |

#### Navigation
| Key | Action |
|-----|--------|
| `j` / `k` | Move down / up |
| `h` | Collapse folder / Go to parent |
| `l` / `Enter` | Expand folder / Open file |
| `E` | Expand all folders |
| `W` | Collapse all folders |
| `H` | Toggle hidden files |

#### Preview vs Open
| Key | Action |
|-----|--------|
| `Tab` or `P` | **Preview file** (cursor stays in tree) |
| `Enter` or `o` | **Open file** (cursor moves to file) |

**Preview workflow**: Use `Tab` to preview multiple files without leaving tree, then `Enter` to open the desired file.

#### File Operations
| Key | Action |
|-----|--------|
| `a` | Add new file/folder |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut file/folder |
| `c` | Copy file/folder |
| `p` | Paste file/folder |
| `y` | Copy file name |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `R` | Refresh tree |

### Fuzzy Finder (Telescope)
| Key | Action |
|-----|--------|
| `<LEADER>ff` | Find files |
| `<LEADER>fg` | Live grep (search text in project) |
| `<LEADER>fb` | Find buffers |
| `<LEADER>fh` | Find help tags |

### Search

#### Search in Current File (Native Vim)
| Key | Action |
|-----|--------|
| `/pattern` | Search forward for pattern |
| `?pattern` | Search backward for pattern |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search current word (forward) |
| `#` | Search current word (backward) |
| `<LEADER><CR>` | Clear search highlight |

#### Search in Project (Telescope)
| Key | Action |
|-----|--------|
| `<LEADER>fg` | Live grep - search text across all files |
| `<LEADER>ff` | Find files by name |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `gh` | Hover documentation |
| `<LEADER>F` | Format code |
| `<LEADER>r` | Rename symbol |
| `<LEADER>ca` | Code action |

### Markdown

#### Browser Preview (markdown-preview)
| Key | Action |
|-----|--------|
| `<LEADER>p` | Toggle Markdown preview in browser |

#### Inline Rendering (render-markdown)
| Key | Action |
|-----|--------|
| `<LEADER>mp` | Toggle inline markdown rendering |

**Features**:
- Beautiful heading rendering with icons and background colors
- Code blocks with language icons and syntax highlighting
- Checkboxes with visual states (☐ ☒)
- Tables with borders and alignment
- Quote blocks with visual indicators
- Bullet lists with different icons per level
- LaTeX formula support

### Git (Gitsigns)
| Key | Action |
|-----|--------|
| `]c` / `[c` | Next / previous hunk |
| `<LEADER>hs` | Stage hunk |
| `<LEADER>hr` | Reset hunk |
| `<LEADER>hp` | Preview hunk |
| `<LEADER>hb` | Blame line |
| `<LEADER>tb` | Toggle blame |
| `<LEADER>hd` | Diff this |

### Git (Diffview)

#### Open/Close
| Key | Action |
|-----|--------|
| `<LEADER>gd` | Open diff view (working tree) |
| `<LEADER>gC` | Close diff view |
| `<LEADER>gf` | Current file history |
| `<LEADER>gF` | Project file history |

#### In Diffview Window
| Key | Action |
|-----|--------|
| `q` | Close diff view |
| `Tab` | Toggle file panel |
| `j` / `k` | Next / previous file |
| `Enter` / `o` | Open file |
| `-` | Stage/unstage file |
| `S` | Stage all files |
| `U` | Unstage all files |
| `X` | Restore file (discard changes) |
| `R` | Refresh |

### Comment
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Toggle comment for selection |

### Surround
| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |
| `S{char}` (visual) | Surround selection |

## 📝 Commands

| Command | Description |
|---------|-------------|
| `:Format` | Format current buffer |
| `:Mason` | Open LSP/DAP/formatter installer |
| `:Lazy` | Open plugin manager |
| `:TSUpdate` | Update Treesitter parsers |
| `:ThemeToggle` | Toggle between light and dark theme |
| `:Theme {light/dark}` | Set specific theme |

## 🎨 Theme

This configuration uses [catppuccin](https://github.com/catppuccin/nvim) theme with:

- **Light mode**: `catppuccin-latte`
- **Dark mode**: `catppuccin-mocha`

The theme automatically detects your system theme on startup. You can also manually toggle with `<LEADER>bg`.

## 🔧 Maintenance

```vim
" Update all plugins
:Lazy update

" Sync plugins
:Lazy sync

" Check health
:checkhealth lazy
:checkhealth mason
:checkhealth lsp
```

## ⚙️ Configuration

### Input Method Switching (im-select)

This configuration includes automatic input method switching:
- **Normal mode**: Automatically switches to English
- **Insert mode**: Restores previous input method (e.g., Chinese)

#### Prerequisites

im-select is an external tool that must be installed separately (Mason/Lazy cannot install it):

##### macOS

```bash
# Option 1: Homebrew (recommended)
brew tap daipeihust/tap
brew install im-select

# Option 2: Direct download
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install.sh | sh
```

##### Windows

Download `im-select.exe` from [GitHub Releases](https://github.com/daipeihust/im-select/releases) and place it in your PATH.

##### Verify Installation

```bash
which im-select    # Should show path
im-select          # Shows current input method ID
```

#### Configuration

Default macOS input method: `com.apple.keylayout.US`

To customize, edit `lua/plugins/plugin-im-select.lua`:
```lua
default_im_select = "com.apple.keylayout.US"  -- Change to your preference
```

Find your input method ID:
```bash
im-select
```

### Keyboard Remapping

#### Map Caps Lock to Esc

```bash
sudo nvim /etc/profile
# Add:
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
source /etc/profile
```

#### Exchange Caps Lock and Esc

```bash
sudo nvim /etc/profile
# Add:
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' -e 'keycode 0x9=Caps_Lock'
source /etc/profile
```

> ⚠️ Note: `Ctrl-C` is NOT the same as `Esc`

### Clipboard

#### Arch Linux

```bash
sudo pacman -S xclip
# Already set in options.lua:
# vim.opt.clipboard = 'unnamedplus'
```

#### Other Systems

Refer to: https://ramezanpour.net/post/2022/07/24/access-os-clipboard-in-neovim

### Font

```bash
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts
./install.sh
sudo fc-cache -fv
```

Then set your terminal font to a Nerd Font (e.g., Hack Nerd Font).

## 📦 Plugins

| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme with auto light/dark mode |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/formatter installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Auto-completion |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX support |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown preview in browser |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Inline Markdown rendering |
| [outline.nvim](https://github.com/hedyhli/outline.nvim) | Code outline |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration (inline diff) |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer and file history |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Key binding hints |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Code commenting |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text manipulation |
| [im-select.nvim](https://github.com/keaising/im-select.nvim) | Automatic input method switching |

## 📄 License

MIT License
