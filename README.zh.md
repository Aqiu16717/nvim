# Neovim 配置

<p align="center">
  <b>基于 Lua 的现代化 Neovim 配置</b><br>
  <a href="README.md">English Version</a>
</p>

---

## 🚀 简介

一个现代化、功能丰富的 Neovim 配置，提供类似 IDE 的编辑体验：
- 🔍 模糊文件搜索和文本查找
- 🌲 文件资源管理器侧边栏
- ✨ 自动补全与 LSP 支持
- 🎨 精美配色方案，支持自动/手动切换浅色/深色模式
- 📊 状态栏和标签页
- 📝 实时 Markdown 预览
- 📑 代码大纲/符号列表
- 🎯 代码格式化
- 🔀 Git 集成与行内差异显示
- ❓ 快捷键提示（which-key）
- 💬 快速代码注释
- 🔄 环绕文本操作

## 📋 环境要求

- Neovim >= 0.11
- Git（用于克隆插件）
- [Nerd Font](https://www.nerdfonts.com/)（用于图标，推荐 Hack Nerd Font）
- `xclip`（Linux，用于系统剪贴板）

## 📦 安装

```bash
# 备份现有配置
mv ~/.config/nvim ~/.config/nvim.backup

# 克隆本仓库
git clone <your-repo-url> ~/.config/nvim

# 启动 Neovim（插件将自动安装）
nvim

# 安装 LSP 服务器
:Mason
```

## 📁 目录结构

```
.
├── init.lua              # 入口文件
├── lazy-lock.json        # 插件锁定文件
├── lua/
│   ├── core/
│   │   └── autocmds.lua  # 自动命令
│   ├── options.lua       # Vim 选项/设置
│   ├── keymaps.lua       # 快捷键映射
│   ├── lazynvim-init.lua # 插件管理器启动
│   ├── lsp.lua           # 原生 LSP 配置
│   ├── colorscheme.lua   # 主题设置
│   ├── command.lua       # 自定义命令
│   └── plugins/          # 插件配置
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

## ⌨️ 快捷键说明

**Leader 键：** `<Space>`（空格键）

### 通用操作
| 快捷键 | 功能 |
|--------|------|
| `Q` | 退出 |
| `<LEADER><CR>` | 清除搜索高亮 |
| `<LEADER>bg` | 切换浅色/深色主题 |

### 窗口管理
| 快捷键 | 功能 |
|--------|------|
| `sh` / `sl` | 左/右分屏 |
| `sj` / `sk` | 下/上分屏 |
| `<LEADER>h/j/k/l` | 切换窗口 |
| `Ctrl+方向键` | 调整窗口大小 |

### 标签页
| 快捷键 | 功能 |
|--------|------|
| `tn` | 新建标签页 |
| `tl` / `th` | 下一个/上一个标签页 |
| `tc` | 关闭标签页 |

### 缓冲区 (Bufferline)
| 快捷键 | 功能 |
|--------|------|
| `bh` | 上一个缓冲区 |
| `bl` | 下一个缓冲区 |
| `bd` | 关闭当前缓冲区 |
| `bq` | 强制关闭缓冲区 |

### 文件浏览器
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>t` | 切换文件树 (nvim-tree) |

### 模糊查找 (Telescope)
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>ff` | 查找文件 |
| `<LEADER>fg` | 实时文本搜索 |
| `<LEADER>fb` | 查找缓冲区 |
| `<LEADER>fh` | 查找帮助文档 |

### LSP（语言服务器）
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gi` | 跳转到实现 |
| `gr` | 查找引用 |
| `gh` | 悬停文档 |
| `<LEADER>F` | 格式化代码 |
| `<LEADER>r` | 重命名符号 |
| `<LEADER>ca` | 代码操作 |

### Markdown
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>p` | 切换 Markdown 预览 |

### Git（Gitsigns）
| 快捷键 | 功能 |
|--------|------|
| `]c` / `[c` | 下一个/上一个修改块 |
| `<LEADER>hs` | 暂存修改块 |
| `<LEADER>hr` | 重置修改块 |
| `<LEADER>hp` | 预览修改块 |
| `<LEADER>hb` | 查看行 blame |
| `<LEADER>tb` | 切换 blame 显示 |
| `<LEADER>hd` | 查看差异 |

### 注释（Comment）
| 快捷键 | 功能 |
|--------|------|
| `gcc` | 切换行注释 |
| `gbc` | 切换块注释 |
| `gc`（可视模式）| 切换选中区域注释 |

### 环绕（Surround）
| 快捷键 | 功能 |
|--------|------|
| `ys{motion}{char}` | 添加环绕字符 |
| `ds{char}` | 删除环绕字符 |
| `cs{old}{new}` | 修改环绕字符 |
| `S{char}`（可视模式）| 为选中区域添加环绕 |

## 📝 常用命令

| 命令 | 说明 |
|------|------|
| `:Format` | 格式化当前缓冲区 |
| `:Mason` | 打开 LSP/DAP/格式化工具安装器 |
| `:Lazy` | 打开插件管理器 |
| `:TSUpdate` | 更新 Treesitter 解析器 |
| `:ThemeToggle` | 切换浅色/深色主题 |
| `:Theme {light/dark}` | 设置指定主题 |

## 🎨 主题

本配置使用 [catppuccin](https://github.com/catppuccin/nvim) 主题：

- **浅色模式**：`catppuccin-latte`
- **深色模式**：`catppuccin-mocha`

主题会在启动时自动检测系统主题。你也可以使用 `<LEADER>bg` 手动切换。

## 🔧 维护操作

```vim
" 更新所有插件
:Lazy update

" 同步插件
:Lazy sync

" 检查健康状态
:checkhealth lazy
:checkhealth mason
:checkhealth lsp
```

## ⚙️ 常用配置

### 键盘重映射

#### 将 Caps Lock 映射为 Esc

```bash
sudo nvim /etc/profile
# 添加：
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
source /etc/profile
```

#### 交换 Caps Lock 和 Esc

```bash
sudo nvim /etc/profile
# 添加：
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' -e 'keycode 0x9=Caps_Lock'
source /etc/profile
```

> ⚠️ 注意：`Ctrl-C` 与 `Esc` 不完全相同

### 剪贴板

#### Arch Linux

```bash
sudo pacman -S xclip
# 已在 options.lua 中设置：
# vim.opt.clipboard = 'unnamedplus'
```

#### 其他系统

参考: https://ramezanpour.net/post/2022/07/24/access-os-clipboard-in-neovim

### 字体

```bash
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts
./install.sh
sudo fc-cache -fv
```

然后在终端设置中设置字体为 Nerd Font（例如 Hack Nerd Font）。

## 📦 使用的插件

| 插件 | 说明 |
|------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 插件管理器 |
| [catppuccin](https://github.com/catppuccin/nvim) | 配色方案，支持自动深浅色切换 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊查找 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法高亮 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 配置 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 安装器 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 自动补全 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件浏览器 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 缓冲区标签 |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | 代码格式化 |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX 支持 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown 预览 |
| [outline.nvim](https://github.com/hedyhli/outline.nvim) | 代码大纲 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 集成 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 快捷键提示 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | 代码注释 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 环绕文本操作 |

## 📄 许可证

MIT License
