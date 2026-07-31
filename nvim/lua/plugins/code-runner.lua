return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    opts = {
      size = 20,
      direction = "horizontal",
      autochdir = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_mode = true,
      persist_size = true,
      shell = vim.o.shell,
    },
  },
}
