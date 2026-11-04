return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "json",
        
        "go",
        "gomod",
        "c_sharp",
        "rust",
        "php",

        "lua",
        "vim",
        "bash",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = {"markdown"},
      },
      indent = {
        enable = true,
      },
    })
  end,
}
