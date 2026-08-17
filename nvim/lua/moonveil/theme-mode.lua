local M = {}

local listeners = {}

local function current_mode()
  local ok, out = pcall(vim.fn.system, "noctalia msg theme-mode-get")
  if not ok or vim.v.shell_error ~= 0 then
    return nil
  end
  local mode = vim.trim(out)
  if mode ~= "dark" and mode ~= "light" then
    return nil
  end
  return mode
end

local function apply()
  local mode = current_mode()
  if not mode or vim.o.background == mode then
    return
  end
  vim.o.background = mode
  vim.cmd.colorscheme("moonveil")
  for _, fn in ipairs(listeners) do
    local ok, err = pcall(fn, mode)
    if not ok then
      vim.notify("theme-mode listener failed: " .. tostring(err))
    end
  end
end

M.on_theme_change = function(fn)
  table.insert(listeners, fn)
end

M.setup = function()
  apply()

  local sig = vim.uv.new_signal()
  if sig then
    sig:start("sigusr1", vim.schedule_wrap(apply))
  end
end

return M
