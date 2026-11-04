return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            float_opts = {
                border = "curved",
            },
        })

        vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Терминал" })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                set_terminal_keymaps()
            end,
        })
    end,
}
