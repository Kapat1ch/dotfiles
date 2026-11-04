vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8

vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true

vim.keymap.set({ "n", "v" }, "<C-/>", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set({ "n", "v" }, "<C-_>", "gcc", { remap = true, desc = "Toggle Comment" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.treesitter.stop(args.buf)
    end,
})

vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
