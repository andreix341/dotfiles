return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({
      delay = 100,
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
    })

    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3a3a3a" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3a3a3a" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3a3a3a" })
  end,
}
