-- Neovim 0.11+ native LSP configuration
-- See :help lspconfig-nvim-0.11

local servers = {
    clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
    },
    gopls = {
        filetypes = { "go", "gomod" },
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
            },
        },
    },
    pylsp = {
        filetypes = { "python" },
    },
}

-- Configure and enable LSP servers
for name, config in pairs(servers) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end
