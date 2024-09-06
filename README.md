```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── colorscheme.lua
│   ├── keymaps.lua
│   ├── lazynvim-init.lua
│   ├── lsp.lua
│   ├── options.lua
│   └── plugins
│       ├── plugin-lualine.lua
│       ├── plugin-markdown-preview.lua
│       ├── plugin-mason-lspconfig.lua
│       ├── plugin-mason.lua
│       ├── plugin-nvim-lspconfig.lua
│       ├── plugin-nvim-tree.lua
│       └── plugin-vimtex.lua
├── README.md
```

## Plugin Manager

* [lazy.nvim](https://github.com/folke/lazy.nvim) 

## LSP

* [mason](https://github.com/williamboman/mason.nvim)
* [lspconfig](https://github.com/neovim/nvim-lspconfig)
* [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)


## Plugin

* markdown previewer

```
amcco/markdown-preview.nvim
```

## About `Esc`

* [`Ctrl-C` is not the same as `Esc`](https://vi.stackexchange.com/questions/25764/use-control-c-instead-of-escape-key)


* map `Caps_Lock` to `Esc`. There exists no `Caps_Lock` anymore.

```bash
sudo nvim /etc/profile
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'  
sourc /etc/profile
```

* exchange CapsLock and Esc

```bash
sudo nvim /etc/profile
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' -e 'keycode 0x9=Caps_Lock'
source /etc/profile
```

## About clipboard

* Arch Linux
    * `sudo pacman -S xclip`
    * `:set clipboard = 'unnamedplus'`
* Other System
    * refer to [this](https://ramezanpour.net/post/2022/07/24/access-os-clipboard-in-neovim)

## Font

```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
./install.sh
sudo fc-cache -fv
```
* set terminal custom font to hack-font
