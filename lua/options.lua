-- mouse
vim.opt.mouse = 'a' -- allow the mouse to be used

-- clipboard
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard


-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.cursorlineopt = "number,line" -- highlight both line number and line

-- Only show cursorline in current window and in normal mode
local cursorline_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd({ "WinLeave", "BufWinLeave" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
    desc = "Hide cursorline when leaving window",
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = true
    end,
    desc = "Show cursorline when entering window",
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
    desc = "Hide cursorline in insert mode",
})

vim.api.nvim_create_autocmd("InsertLeave", {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = true
    end,
    desc = "Show cursorline when leaving insert mode",
})


-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

