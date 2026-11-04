return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,

            color_overrides = {
                mocha = {
                    green = "#7dc4a5",
                    teal = "#8fdcb8",
                    text = "#e1e7ec",
                    subtext1 = "#abb2bf",
                    subtext0 = "#94a3b8",
                    overlay0 = "#5c6370",
                    blue = "#61afef",
                    red = "#e06c75",
                    yellow = "#e5c07b",
                    peach = "#d19a66",
                    mauve = "#c678dd",
                },
            },

            highlight_overrides = {
                mocha = function(c)
                    return {
                        LineNr = { fg = "#4b5263" },
                        CursorLineNr = { fg = c.green, bold = true },
                        NormalFloat = { bg = "none" },
                        FloatBorder = { fg = c.green, bg = "none" },
                        CursorLine = { bg = "#14191f" },
                    }
                end,
            },

            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                cmp = true,
                gitsigns = true,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
