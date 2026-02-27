return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Keymaps are now set automatically by the plugin
                -- See :h nvim-surround.usage for default mappings
                --
                -- Normal mode:
                --   ys{motion}{char}  - Add surround
                --   yss{char}         - Add surround to current line
                --   ds{char}          - Delete surround
                --   cs{old}{new}      - Change surround
                --
                -- Visual mode:
                --   S{char}           - Add surround to selection
                --
                -- Insert mode:
                --   <C-g>s{char}      - Add surround
                --   <C-g>S{char}      - Add surround to current line

                surrounds = {
                    ["("] = { add = { "( ", " )" }, find = "(%(.-))", delete = "^(%( ?)().-( ?%))()$" },
                    [")"] = { add = { "(", ")" }, find = "(%(.-))", delete = "^(%()().-(%))()$" },
                    ["{"] = { add = { "{ ", " }" }, find = "({.-})", delete = "^({ ?)().-( ?})()$" },
                    ["}"] = { add = { "{", "}" }, find = "({.-})", delete = "^({)().-(})()$" },
                    ["<"] = { add = { "< ", " >" }, find = "(<.-)", delete = "^(< ?)().-( ?>)()$" },
                    [">"] = { add = { "<", ">" }, find = "(<.-)", delete = "^(<)().-(>)()$" },
                    ["["] = { add = { "[ ", " ]" }, find = "(%[.-%])", delete = "^(%[ ?)().-( ?%])()$" },
                    ["]"] = { add = { "[", "]" }, find = "(%[.-%])", delete = "^(%[)().-(%])()$" },
                },
                highlight = {
                    duration = 0,
                },
                move_cursor = "begin",
            })
        end,
    },
}
