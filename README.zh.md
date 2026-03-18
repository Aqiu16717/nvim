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
- `im-select`（可选，用于 macOS 自动输入法切换）

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

### 启动页（Dashboard）

当你不带文件参数打开 Neovim 时，会显示一个启动页：

```
 ╔═══════════════════════════════════════════════════════╗
 ║  [ Neovim Logo ]                                      ║
 ║                                                       ║
 ║  📁  查找文件           (f)                          ║
 ║  📄  最近文件           (r)                          ║
 ║  🔍  查找文本           (g)                          ║
 ║  ⚙️   配置               (c)                          ║
 ║  📦  更新插件           (u)                          ║
 ║  ❌  退出               (q)                          ║
 ║                                                       ║
 ║  🗂️   最近项目                                        ║
 ║  📝  最近文件                                         ║
 ╚═══════════════════════════════════════════════════════╝
```

| 快捷键 | 功能 |
|--------|------|
| `f` | 查找文件 |
| `r` | 最近文件 |
| `g` | 实时搜索 |
| `c` | 编辑配置 |
| `u` | 更新插件 |
| `q` | 退出 |
| `<LEADER>H` | 随时打开启动页 |

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

### 文件浏览器 (nvim-tree)

#### 基本操作
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>t` | 切换文件树 |
| `q` | 关闭文件树 |
| `?` | 显示帮助（所有快捷键）|

#### 导航
| 快捷键 | 功能 |
|--------|------|
| `j` / `k` | 向下/向上移动 |
| `h` | 折叠文件夹/返回上级 |
| `l` / `Enter` | 展开文件夹/打开文件 |
| `E` | 展开所有文件夹 |
| `W` | 折叠所有文件夹 |
| `H` | 显示/隐藏隐藏文件 |

#### 预览 vs 打开
| 快捷键 | 功能 |
|--------|------|
| `Tab` 或 `P` | **预览文件**（光标留在 tree）|
| `Enter` 或 `o` | **打开文件**（光标移到文件）|

**预览工作流**：使用 `Tab` 预览多个文件而不离开 tree，找到后用 `Enter` 打开。

#### 文件操作
| 快捷键 | 功能 |
|--------|------|
| `a` | 新建文件/文件夹 |
| `d` | 删除文件/文件夹 |
| `r` | 重命名文件/文件夹 |
| `x` | 剪切文件/文件夹 |
| `c` | 复制文件/文件夹 |
| `p` | 粘贴文件/文件夹 |
| `y` | 复制文件名 |
| `Y` | 复制相对路径 |
| `gy` | 复制绝对路径 |
| `R` | 刷新文件树 |

### 模糊查找 (Telescope)
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>ff` | 查找文件 |
| `<LEADER>fg` | 实时文本搜索（在项目中搜索）|
| `<LEADER>fb` | 查找缓冲区 |
| `<LEADER>fh` | 查找帮助文档 |

### 搜索

#### 当前文件内搜索（Vim 原生）
| 快捷键 | 功能 |
|--------|------|
| `/pattern` | 向前搜索 pattern |
| `?pattern` | 向后搜索 pattern |
| `n` | 下一个匹配 |
| `N` | 上一个匹配 |
| `*` | 搜索当前单词（向前）|
| `#` | 搜索当前单词（向后）|
| `<LEADER><CR>` | 清除搜索高亮 |

#### 项目级搜索（Telescope）
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>fg` | 实时 grep - 在所有文件中搜索文本 |
| `<LEADER>ff` | 按文件名查找文件 |

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

#### C/C++ 专用
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>a` | 在头文件和源文件之间切换（需要 clangd）|
| `gf` | 跳转到文件（C/C++ 头文件增强）|

### 代码大纲（Outline）
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>o` | 切换大纲侧边栏 |
| `Enter` | 跳转到符号 |
| `K` | 切换预览 |
| `r` | 重命名符号 |
| `a` | 代码操作 |
| `<C-space>` | 悬停符号 |

### Markdown

#### 浏览器预览（markdown-preview）
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>p` | 在浏览器中预览 Markdown |

#### 行内渲染（render-markdown）
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>mp` | 切换行内 Markdown 渲染 |

**功能特性**：
- 精美的标题渲染，带图标和背景色
- 代码块显示语言图标和语法高亮
- 复选框可视化状态（☐ ☒）
- 表格带边框和对齐
- 引用块带视觉指示器
- 多级列表使用不同图标
- 支持 LaTeX 公式

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

### Git（Diffview）

#### 打开/关闭
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>gd` | 打开 diff 视图（工作区）|
| `<LEADER>gC` | 关闭 diff 视图 |
| `<LEADER>gf` | 当前文件历史 |
| `<LEADER>gF` | 项目文件历史 |

#### Diffview 窗口内操作
| 快捷键 | 功能 |
|--------|------|
| `q` | 关闭 diff 视图 |
| `Tab` | 切换文件面板 |
| `j` / `k` | 下一个/上一个文件 |
| `Enter` / `o` | 打开文件 |
| `-` | 暂存/取消暂存文件 |
| `S` | 暂存所有文件 |
| `U` | 取消暂存所有文件 |
| `X` | 恢复文件（丢弃修改）|
| `R` | 刷新 |

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

### 终端（Toggleterm）

#### 打开/关闭终端
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>tt` | 切换终端（水平）|
| `<LEADER>tf` | 切换终端（浮动）|
| `<LEADER>tv` | 切换终端（垂直）|
| `<C-\>` | 快速切换终端 |
| `<Esc>` | 退出终端模式 |

#### 特殊终端
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>tg` | 打开 lazygit（需安装 lazygit）|
| `<LEADER>tp` | 打开 Python REPL |
| `<LEADER>tn` | 打开 Node REPL |

#### 终端导航
| 快捷键 | 功能 |
|--------|------|
| `<C-h/j/k/l>` | 从终端窗口导航到其他窗口 |

### 调试（DAP - Debug Adapter Protocol）

#### 断点
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>db` | 切换断点 |
| `<LEADER>dB` | 设置条件断点 |

#### 调试控制
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>dc` | 开始/继续调试 |
| `<LEADER>dt` | 终止调试 |
| `<LEADER>dp` | 暂停 |
| `<LEADER>dr` | 重新启动 |

#### 单步调试
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>dj` | 单步跳过 |
| `<LEADER>dk` | 单步进入 |
| `<LEADER>do` | 单步跳出 |

#### 调试界面
| 快捷键 | 功能 |
|--------|------|
| `<LEADER>du` | 切换调试界面 |
| `<LEADER>de` | 计算表达式 |

**支持语言**：C、C++、Rust

**C++ 调试设置**：
1. 安装调试适配器：`:Mason` → 安装 `codelldb` 或 `cpptools`
2. 使用 `<LEADER>db` 设置断点
3. 使用 `<LEADER>dc` 开始调试
4. 按提示输入编译后的可执行文件路径

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

本配置使用 [catppuccin](https://github.com/catppuccin/nvim) 主题。

**默认**：`catppuccin-latte`（浅色）

**可用变体**：
- `catppuccin-latte` - 浅色主题（默认）
- `catppuccin-frappe` - 深色主题（柔和）
- `catppuccin-macchiato` - 深色主题（中等）
- `catppuccin-mocha` - 深色主题（强烈）

如需更改主题，编辑 `lua/plugins/plugin-catppuccin.lua`：
```lua
flavour = "mocha"  -- 改为你喜欢的变体
```

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

### C/C++ 开发

#### .clang-format 自动检测

在带有 `.clang-format` 文件的 C/C++ 项目中编辑时，Neovim 会自动：
- 检测缩进设置（2 空格、4 空格或制表符）
- 自动应用到 `shiftwidth`、`tabstop` 和 `expandtab`
- 确保输入时的缩进与保存时的格式化一致

**示例**：如果你的 `.clang-format` 包含：
```yaml
IndentWidth: 2
UseTab: Never
```

Neovim 将自动在该项目中使用 2 空格缩进。

### 输入法自动切换（im-select）

本配置支持输入法自动切换：
- **普通模式**：自动切换为英文
- **插入模式**：恢复之前的输入法（如中文）

#### 前置要求

im-select 是外部工具，必须单独安装（Mason/Lazy 无法安装）：

##### macOS

```bash
# 方式 1：Homebrew（推荐）
brew tap daipeihust/tap
brew install im-select

# 方式 2：直接下载
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install.sh | sh
```

##### Windows

从 [GitHub Releases](https://github.com/daipeihust/im-select/releases) 下载 `im-select.exe` 放到 PATH 目录。

##### 验证安装

```bash
which im-select    # 应显示路径
im-select          # 显示当前输入法 ID
```

#### 配置说明

默认 macOS 输入法：`com.apple.keylayout.US`

如需自定义，编辑 `lua/plugins/plugin-im-select.lua`：
```lua
default_im_select = "com.apple.keylayout.US"  -- 改为你的首选输入法
```

查看你的输入法 ID：
```bash
im-select
```

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
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | 启动页仪表盘 |
| [catppuccin](https://github.com/catppuccin/nvim) | 配色方案 |
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
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | 浏览器中预览 Markdown |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | 行内 Markdown 渲染 |
| [outline.nvim](https://github.com/hedyhli/outline.nvim) | 代码大纲 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 集成（行内 diff）|
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff 查看器和文件历史 |
hello
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 快捷键提示 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | 代码注释 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 环绕文本操作 |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 集成终端 |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | 调试适配器协议 |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | 调试界面 |
| [im-select.nvim](https://github.com/keaising/im-select.nvim) | 自动输入法切换 |

## 📄 许可证

MIT License
