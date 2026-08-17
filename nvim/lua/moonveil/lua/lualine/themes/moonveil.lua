local dark = {
  bg = "#000000",
  fg = "#EEEEEE",
  dim = "#6D6964",
  mauve = "#BB9AF7",
  purple = "#C792EA",
  purple_soft = "#C6A0F6",
  green = "#98C379",
  pink = "#F280B0",
  orange = "#E2A76F",
  red = "#F06C6C",
  cyan = "#8FB9D8",
}

local light = {
  bg = "#F2F2F2",
  fg = "#1A1A1A",
  dim = "#555555",
  mauve = "#5A649D",
  purple = "#7A4490",
  purple_soft = "#925BB8",
  green = "#4A7A38",
  pink = "#AC2F78",
  orange = "#A16A28",
  red = "#AC2F2F",
  cyan = "#33579C",
}

local p = vim.o.background == "light" and light or dark

local M = {
  normal = {
    a = { fg = p.bg, bg = p.mauve, gui = "bold" },
    b = { fg = p.mauve, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  insert = {
    a = { fg = p.bg, bg = p.green, gui = "bold" },
    b = { fg = p.green, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  visual = {
    a = { fg = p.bg, bg = p.pink, gui = "bold" },
    b = { fg = p.pink, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  replace = {
    a = { fg = p.bg, bg = p.orange, gui = "bold" },
    b = { fg = p.orange, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  command = {
    a = { fg = p.bg, bg = p.purple_soft, gui = "bold" },
    b = { fg = p.purple_soft, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  terminal = {
    a = { fg = p.bg, bg = p.dim, gui = "bold" },
    b = { fg = p.dim, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  },
  inactive = {
    a = { fg = p.dim, bg = p.bg },
    b = { fg = p.dim, bg = p.bg },
    c = { fg = p.dim, bg = p.bg },
  },
}

local states = {
  normal_error = p.red,
  normal_warning = p.orange,
  insert_error = p.red,
  insert_warning = p.orange,
  visual_error = p.red,
  visual_warning = p.orange,
  replace_error = p.red,
  replace_warning = p.orange,
  command_error = p.red,
  command_warning = p.orange,
  terminal_error = p.red,
  terminal_warning = p.orange,
}

for name, col in pairs(states) do
  M[name] = {
    a = { fg = p.bg, bg = col, gui = "bold" },
    b = { fg = col, bg = p.bg },
    c = { fg = p.fg, bg = p.bg },
  }
end

return M
