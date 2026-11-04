return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
  end,
}
