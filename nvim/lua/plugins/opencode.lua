return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}
    vim.o.autoread = true

    local function ask_and_submit(prefix)
      require("opencode").ask(prefix, { submit = false })
      vim.defer_fn(function()
        local ok, term = pcall(function()
          return require("snacks.terminal").get("opencode --port", { create = false })
        end)
        if ok and term then
          require("opencode").command("prompt.submit")
        end
      end, 150)
    end

    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      ask_and_submit("/home/pumk/.config/nvim/lua/plugins/opencode.lua:L39:C1: ")
    end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("/home/pumk/.config/nvim/lua/plugins/opencode.lua:L39:C1 ")
    end, { expr = true, desc = "Add range to opencode" })
    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("/home/pumk/.config/nvim/lua/plugins/opencode.lua:L39:C1 ") .. "_"
    end, { expr = true, desc = "Add line to opencode" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "opencode half page down" })
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
}
