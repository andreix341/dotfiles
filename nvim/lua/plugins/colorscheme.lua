local dir = vim.fn.stdpath("config") .. "/lua/moonveil"

return {
  {
    dir = dir,
    name = "moonveil",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonveil")

      local ok, tm = pcall(require, "moonveil.theme-mode")
      if ok then
        tm.setup()
      end
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        themable = false,
      },
    },
  },
}
