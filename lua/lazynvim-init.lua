-- Define lazypath.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Add lazy.nvim to the runtime path.
vim.opt.rtp:prepend(lazypath)

-- This line initializes the lazy.nvim plugin manager and looks for a file or directory named plugins.lua or plugins where the plugins are defined.
require("lazy").setup("plugins")

