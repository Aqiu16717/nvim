-- set leader key
vim.g.mapleader = " "

-- set no high light search
vim.keymap.set("n", "<LEADER><CR>", ":nohlsearch<CR>")

-- set quit
vim.keymap.set("n", "Q", ":q<CR>")

-- window split
vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "sh", ":set splitright<CR>:vsplit<CR>")
vim.keymap.set("n", "sl", ":set nosplitright<CR>:vsplit<CR>")
vim.keymap.set("n", "sj", ":set nosplitbelow<CR>:split<CR>")
vim.keymap.set("n", "sk", ":set splitbelow<CR>:split<CR>")

-- window move
vim.keymap.set("n", "<LEADER>h", "<C-w>h")
vim.keymap.set("n", "<LEADER>j", "<C-w>j")
vim.keymap.set("n", "<LEADER>k", "<C-w>k")
vim.keymap.set("n", "<LEADER>l", "<C-w>l")

-- window size
vim.keymap.set("n", "<C-Up>", ":resize +5<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -5<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -5<CR>")

-- tab
vim.keymap.set("n", "tn", ":tabe<CR>")
vim.keymap.set("n", "tl", ":+tabnext<CR>")
vim.keymap.set("n", "th", ":-tabnext<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")


-- markdown preview
vim.keymap.set("n", "<LEADER>p", ":MarkdownPreviewToggle<CR>")
