return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
            surrounds = {
                ["("] = { add = { "(", ")" }, find = function()
                    return M.get_selection({ motion = "a(" })
                end, delete = "^(. ?)().-( ?.)()$" },
                [")"] = { add = { "(", ")" }, find = function()
                    return M.get_selection({ motion = "a(" })
                end, delete = "^(. ?)().-( ?.)()$" },
                ["{"] = { add = { "{", "}" }, find = function()
                    return M.get_selection({ motion = "a{" })
                end, delete = "^(. ?)().-( ?.)()$" },
                ["}"] = { add = { "{", "}" }, find = function()
                    return M.get_selection({ motion = "a{" })
                end, delete = "^(. ?)().-( ?.)()$" },
                ["<"] = { add = { "<", ">" }, find = function()
                    return M.get_selection({ motion = "a<" })
                end, delete = "^(. ?)().-( ?.)()$" },
                [">"] = { add = { "<", ">" }, find = function()
                    return M.get_selection({ motion = "a<" })
                end, delete = "^(. ?)().-( ?.)()$" },
                ["["] = { add = { "[", "]" }, find = function()
                    return M.get_selection({ motion = "a[" })
                end, delete = "^(. ?)().-( ?.)()$" },
                ["]"] = { add = { "[", "]" }, find = function()
                    return M.get_selection({ motion = "a[" })
                end, delete = "^(. ?)().-( ?.)()$" },
            },
            highlight = {
                duration = 0,
            },
            move_cursor = "begin",
            indent_lines = function(start, stop)
                local b = vim.bo
                for i = start, stop do
                    vim.cmd(i .. "left " .. b.shiftwidth)
                end
            end,
        },
    },
}
