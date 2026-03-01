return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "left",
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")

                    -- Default mappings
                    api.config.mappings.default_on_attach(bufnr)
                end,
            })

            -- Fix cursorline after closing nvim-tree
            local group = vim.api.nvim_create_augroup("NvimTreeCursorline", { clear = true })
            vim.api.nvim_create_autocmd("WinEnter", {
                group = group,
                callback = function()
                    -- Re-enable cursorline when entering normal windows
                    if vim.bo.filetype ~= "NvimTree" then
                        vim.opt_local.cursorline = true
                    end
                end,
            })
        end,
    },
}
