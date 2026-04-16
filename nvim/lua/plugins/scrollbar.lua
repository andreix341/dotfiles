return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup({
      show = true,
      show_in_active_only = false,
      hide_if_all_visible = false, -- hide scrollbar when everything fits on screen
      handle = {
        color = "#4f4f4f", -- scrollbar handle color
      },
      marks = {
        Search = { color = "#ffcc00" }, -- bright yellow like VS Code
        Error = { color = "#ff5555" },
        Warn = { color = "#ffaa00" },
        Info = { color = "#88ccff" },
        Hint = { color = "#77dd77" },
      },
      handlers = {
        search = true, -- ← this is the key for in-file search/occurrences
        diagnostic = true,
        gitsigns = true, -- optional: shows git changes
      },
    })

    require("hlslens").setup({
      calm_down = true,
      nearest_only = false,
    })

    -- Optional: make * and # also show highlights nicely
    vim.keymap.set("n", "*", function()
      vim.fn.execute("normal! *")
      require("hlslens").start()
    end)

    vim.keymap.set("n", "#", function()
      vim.fn.execute("normal! #")
      require("hlslens").start()
    end)
  end,
}
