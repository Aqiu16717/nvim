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

### Dashboard (Startup Screen)

When you open Neovim without a file argument, a dashboard will appear:

```
 ╔═══════════════════════════════════════════════════════╗
 ║  [ Neovim Logo ]                                      ║
 ║                                                       ║
 ║  📁  Find File           (f)                         ║
 ║  📄  Recent Files        (r)                         ║
 ║  🔍  Find Text           (g)                         ║
 ║  ⚙️   Config              (c)                         ║
 ║  📦  Update Plugins      (u)                         ║
 ║  ❌  Quit                (q)                         ║
 ║                                                       ║
 ║  🗂️   Recent Projects                                 ║
 ║  📝  Recent Files                                     ║
 ╚═══════════════════════════════════════════════════════╝
```

| Key | Action |
|-----|--------|
| `f` | Find file |
| `r` | Recent files |
| `g` | Live grep |
| `c` | Edit config |
| `u` | Update plugins |
| `q` | Quit |
| `<LEADER>H` | Open dashboard anytime |

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
| `<LEADER>e` | Show diagnostic details (Error/Warning) |
| `<LEADER>tv` | Toggle diagnostic virtual text |

#### C/C++ Specific
| Key | Action |
|-----|--------|
| `<LEADER>a` | Switch between header and source file (requires clangd) |
| `gf` | Go to file (enhanced for C/C++ headers) |

### Outline (Code Structure)
| Key | Action |
|-----|--------|
| `<LEADER>o` | Toggle outline sidebar |
| `Enter` | Jump to symbol |
| `K` | Toggle preview |
| `r` | Rename symbol |
| `a` | Code actions |
| `<C-space>` | Hover symbol |

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

### Terminal (Toggleterm)

#### Open/Close Terminal
| Key | Action |
|-----|--------|
| `<LEADER>tt` | Toggle terminal (horizontal) |
| `<LEADER>tf` | Toggle terminal (float) |
| `<LEADER>tv` | Toggle terminal (vertical) |
| `<C-\>` | Quick toggle terminal |
| `<Esc>` | Exit terminal mode |

#### Special Terminals
| Key | Action |
|-----|--------|
| `<LEADER>tg` | Open lazygit (requires lazygit installed) |
| `<LEADER>tp` | Open Python REPL |
| `<LEADER>tn` | Open Node REPL |

#### Terminal Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows from terminal |

### AI Assistance

This configuration includes AI-powered development tools:

#### Avante.nvim (AI Chat & Code Edit)

Similar to Cursor IDE, providing AI chat and intelligent code editing.

| Key | Action |
|-----|--------|
| `<LEADER>aa` | Open AI sidebar |
| `<LEADER>ar` | Refresh AI sidebar |
| `<LEADER>af` | Focus AI sidebar |
| `<LEADER>ae` | Edit with AI instruction |
| `<LEADER>ah` | Ask AI about code |

**Setup:**
```bash
# Set your API key (add to ~/.zshrc or ~/.bashrc)
export ANTHROPIC_API_KEY=your_claude_api_key
# or
export OPENAI_API_KEY=your_openai_api_key
```

**Usage:**
1. Open any code file
2. Press `<LEADER>aa` to open AI sidebar
3. Ask questions or request code changes
4. AI will suggest edits that you can apply with one key

#### GitHub Copilot (Code Completion)

| Key | Action |
|-----|--------|
| `<M-l>` (Alt+l) | Accept suggestion |
| `<M-]>` (Alt+]) | Next suggestion |
| `<M-[>` (Alt+[) | Previous suggestion |
| `<C-]>` (Ctrl+]) | Dismiss suggestion |
| `<M-CR>` (Alt+Enter) | Open Copilot panel |

**Setup:**
```bash
# Authenticate Copilot (run in Neovim)
:Copilot auth
```

### Debugging (DAP - Debug Adapter Protocol)

#### Breakpoints
| Key | Action |
|-----|--------|
| `<LEADER>db` | Toggle breakpoint |
| `<LEADER>dB` | Set conditional breakpoint |

#### Debug Controls
| Key | Action |
|-----|--------|
| `<LEADER>dc` | Start/Continue debugging |
| `<LEADER>dt` | Terminate debugging |
| `<LEADER>dp` | Pause |
| `<LEADER>dr` | Restart |

#### Step Controls
| Key | Action |
|-----|--------|
| `<LEADER>dj` | Step over |
| `<LEADER>dk` | Step into |
| `<LEADER>do` | Step out |

#### Debug UI
| Key | Action |
|-----|--------|
| `<LEADER>du` | Toggle debug UI |
| `<LEADER>de` | Evaluate expression |

**Supported languages**: C, C++, Rust

**Setup for C++ debugging**:
1. Install debug adapter: `:Mason` → install `codelldb` or `cpptools`
2. Set breakpoint with `<LEADER>db`
3. Start debugging with `<LEADER>dc`
4. Enter path to your compiled executable when prompted

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

This configuration uses [catppuccin](https://github.com/catppuccin/nvim) theme.

**Default**: `catppuccin-latte` (light)

**Available variants**:
- `catppuccin-latte` - Light theme (default)
- `catppuccin-frappe` - Dark theme (soft)
- `catppuccin-macchiato` - Dark theme (medium)
- `catppuccin-mocha` - Dark theme (strong)

To change theme, edit `lua/plugins/plugin-catppuccin.lua`:
```lua
flavour = "mocha"  -- Change to your preferred variant
```

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

### C/C++ Development

#### .clang-format Auto-detection

When editing C/C++ files in a project with `.clang-format`, Neovim will automatically:
- Detect the indentation settings (2 spaces, 4 spaces, or tabs)
- Apply them to `shiftwidth`, `tabstop`, and `expandtab`
- This ensures consistent indentation while typing, before saving

**Supported formats**:
```yaml
# Explicit settings
IndentWidth: 2
UseTab: Never

# Or using BasedOnStyle
BasedOnStyle: Google  # Automatically uses 2 spaces
BasedOnStyle: LLVM    # Automatically uses 2 spaces
BasedOnStyle: WebKit  # Automatically uses 4 spaces
BasedOnStyle: Microsoft # Automatically uses 4 tabs
```

**Manual commands** (if auto-detection doesn't work):
```vim
:SetGoogleStyle       " Google/Chromium/LLVM/Mozilla (2 spaces)
:SetLLVMStyle         " LLVM style (2 spaces)
:SetWebKitStyle       " WebKit style (4 spaces)
:SetMicrosoftStyle    " Microsoft style (4 tabs)
:ClangFormatInfo     " Show detected config
```

**Project-specific config** (create `.nvim.lua` in project root):
```lua
-- .nvim.lua
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
```

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
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Startup dashboard |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme |
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
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Integrated terminal |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugging UI |
| [im-select.nvim](https://github.com/keaising/im-select.nvim) | Automatic input method switching |
| [avante.nvim](https://github.com/yetone/avante.nvim) | AI chat and code editing (like Cursor) |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot integration |

## 📄 License

MIT License
