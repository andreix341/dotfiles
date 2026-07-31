-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete LazyVim's default <c-/> / <c-_> before our own toggleterm binding
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")

-- Window navigation with Ctrl+h/j/k/l (works in all modes including terminal)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Terminal mode navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Navigate to left window (terminal)" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Navigate to down window (terminal)" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Navigate to up window (terminal)" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Navigate to right window (terminal)" })

-- Escape terminal mode with Ctrl+; (alternative to Ctrl+\ Ctrl+n)
vim.keymap.set("t", "<C-;>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable unused LazyVim keymaps
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>S")
vim.keymap.del("n", "<leader>.")

-- Snacks picker keymaps (file finder and live grep)
vim.keymap.set("n", "<leader><leader>", function() require("snacks").picker.pick("files") end, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", function() require("snacks").picker.pick("grep", { live = true }) end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fz", function() require("snacks").picker.pick("grep", { live = true, regex = false }) end, { desc = "Live plain grep" })

local TERM_ID = 1
local term_opts = { size = 20, direction = "horizontal" }

local function toggle_term()
  require("toggleterm").toggle(TERM_ID, term_opts.size, nil, term_opts.direction)
end

vim.keymap.set({ "n", "t" }, "<c-/>", toggle_term, { desc = "Toggle Terminal" })
vim.keymap.set({ "n", "t" }, "<c-_>", toggle_term, { desc = "Toggle Terminal" })

local runners = {
  python = function() return "python3 " .. vim.fn.expand("%:p") end,
  lua = function() return "lua " .. vim.fn.expand("%:p") end,
  javascript = function() return "node " .. vim.fn.expand("%:p") end,
  typescript = function() return "deno run " .. vim.fn.expand("%:p") end,
  sh = function() return "bash " .. vim.fn.expand("%:p") end,
  go = function() return "go run " .. vim.fn.expand("%:p") end,
  rust = function() return "cargo run" end,
  c = function()
    local dir, base, name = vim.fn.expand("%:p:h"), vim.fn.expand("%:t"), vim.fn.expand("%:t:r")
    return string.format("cd %s && gcc %s -o %s && ./%s", dir, base, name, name)
  end,
  cpp = function()
    local dir, base, name = vim.fn.expand("%:p:h"), vim.fn.expand("%:t"), vim.fn.expand("%:t:r")
    return string.format("cd %s && g++ %s -o %s && ./%s", dir, base, name, name)
  end,
}

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("write")
  local build = runners[vim.bo.filetype]
  if not build then
    return vim.notify("No runner configured for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
  end
  require("toggleterm").exec(build(), TERM_ID, term_opts.size, nil, term_opts.direction)
end, { desc = "Run current file" })
