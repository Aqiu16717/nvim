require("options")
require("keymaps")
require("lazynvim-init")
require("lsp")
require("colorscheme")
require("command")
require("core.autocmds")

-- Auto-detect .clang-format for C/C++ projects
require("core.clang-format-detector").setup()
