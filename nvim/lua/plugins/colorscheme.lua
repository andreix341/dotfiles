local dir = vim.fn.stdpath("config") .. "/lua/moonveil"

return {
  {
    dir = dir,
    name = "moonveil",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonveil")
    end,
  },
}