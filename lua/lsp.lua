-- Native LSP configuration for Neovim 0.11+
-- See :help vim.lsp

vim.lsp.enable({
    "clangd",
    "gopls",
    "lua_ls",
    "pylsp",
})

-- Global LSP configuration
vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git", ".hg", ".svn", ".bzr", "_darcs" },
})

-- Server-specific configurations
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.lsp.config("gopls", {
    filetypes = { "go", "gomod" },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config("pylsp", {
    filetypes = { "python" },
})
