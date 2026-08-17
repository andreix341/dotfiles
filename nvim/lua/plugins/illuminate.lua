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

    local function set_highlight()
      local bg, fg = "#5C5E8C", "#EEEEEE"
      if vim.o.background == "light" then
        bg, fg = "#E8DDF3", nil
      end
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = fg, bg = bg })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = fg, bg = bg })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = fg, bg = bg })
    end
    set_highlight()

    local ok, tm = pcall(require, "moonveil.theme-mode")
    if ok and tm.on_theme_change then
      tm.on_theme_change(set_highlight)
    end
  end,
}
