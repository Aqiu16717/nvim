return {
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen", "OutlineClose" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        config = function()
            require("outline").setup({
                outline_window = {
                    position = "right",
                    width = 25,
                    relative_width = true,
                },
                outline_items = {
                    show_symbol_lineno = true,
                    show_symbol_details = false,
                },
                symbol_folding = {
                    autofold_depth = 1,
                    auto_unfold = {
                        hovered = true,
                    },
                },
                preview_window = {
                    auto_preview = true,
                    live = true,
                },
                keymaps = {
                    toggle_preview = "K",
                    hover_symbol = "<C-space>",
                    rename_symbol = "r",
                    code_actions = "a",
                },
            })
        end,
    },
}
