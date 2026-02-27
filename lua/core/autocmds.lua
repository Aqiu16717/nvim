-- Autocommands configuration
-- See :help autocmd

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("General Settings", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
    group = general,
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
    desc = "Highlight on yank",
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = general,
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
    desc = "Remove trailing whitespace",
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
    group = general,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = "Return to last edit position",
})

-- Automatically reload file if changed outside
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = general,
    command = "checktime",
    desc = "Check for file changes",
})

-- Resize splits when window is resized
autocmd("VimResized", {
    group = general,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
    desc = "Resize splits on window resize",
})

-- Close some filetypes with <q>
autocmd("FileType", {
    group = general,
    pattern = {
        "help",
        "man",
        "qf",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
    desc = "Close with q",
})

-- Wrap and check for spell in text filetypes
autocmd("FileType", {
    group = general,
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
    desc = "Enable wrap and spell for text",
})

-- LSP-related autocommands
local lsp_group = augroup("LSP Settings", { clear = true })

autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Document highlight
        if client and client:supports_method("textDocument/documentHighlight") then
            local highlight_group = augroup("LspDocumentHighlight", { clear = false })

            autocmd({ "CursorHold", "CursorHoldI" }, {
                group = highlight_group,
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = highlight_group,
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- Inlay hints
        if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        -- Format on save
        if client and client:supports_method("textDocument/formatting") then
            autocmd("BufWritePre", {
                group = augroup("LspFormatOnSave", { clear = false }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    desc = "LSP attach configuration",
})

-- Terminal settings
local terminal = augroup("Terminal Settings", { clear = true })

autocmd("TermOpen", {
    group = terminal,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd("startinsert")
    end,
    desc = "Terminal settings",
})

-- Auto create directory when saving file
autocmd("BufWritePre", {
    group = general,
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
    desc = "Auto create directory",
})
