return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = { enabled = false },
      picker = {
        enabled = true,
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup", icon = " " },
        },
        preset = {
          header = [[

                         ▀█▄▄                 
              ▄▄▄     ▄▒  ▄▀                  
  ░▄   ▄▀▄  ▄▀ ▒▒▒▄   ▓▓▄░░░▄   ░▄   ▄▄   ▄▄  
  ░░░▄▀  ▒▒▄   ▓▓▓    ██ ▓▓▓    ░░░▄▀ ▒▒▄▀ ▒▒▄
  ▒▒▒    ▒▓▓   ███   ▐▓▓ ███    ▒▒▒   ▒▓▌  ▒▓▓
  ▓▓▓    ▓██   ▓▓▓   ▒▒▒ ▓▓▓    ▓▓▓   ▓█   ▓██
  ███    █▓▓    ▒▒▄  ░░  ▒▒▒ ▄  ███   █▀   █▓▓
 ▄▓▓▓▄   ▓▒▒     ▀░░░▀   ▀░░▄▀ ▄▓▓▓▄       ▓▒▒
  ▀▒▀   ▄▒▀                     ▀▒▀       ▐▒▀ 
      ▄▀▀                                ▄▀   
          ]],
        },
      },
    },
  },
  { "dmtrKovalenko/fff.nvim", enabled = false },

  -- Optional: completely disable Snacks terminal if you really hate it
  -- { "folke/snacks.nvim", enabled = false },
}
