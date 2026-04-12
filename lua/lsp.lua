-- Native LSP configuration for Neovim 0.11+
-- See :help vim.lsp

-- Diagnostic configuration: W/E signs + toggleable virtual text
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
    },
    virtual_text = false,  -- 默认不显示，避免干扰
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

-- Show line diagnostics in floating window
vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Show diagnostic details" })

-- Toggle virtual text
vim.keymap.set("n", "<leader>tv", function()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = not config.virtual_text,
    })
end, { desc = "Toggle diagnostic virtual text" })

vim.lsp.enable({
    "clangd",
    "gopls",
    "lua_ls",
    "pylsp",
    "ts_ls",
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

vim.lsp.config("ts_ls", {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})
