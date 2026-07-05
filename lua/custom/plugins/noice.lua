local function gh(repo) return "https://github.com/" .. repo end

-- 1. Add plugins to the native runtime package paths
vim.pack.add {
  { src = gh "rcarriga/nvim-notify" },
  { src = gh "MunifTanjim/nui.nvim" },
  { src = gh "folke/noice.nvim" },
}

-- 2. Configure nvim-notify
require("notify").setup {
  background_colour = "#000000", -- Match your theme's background
}
-- Override the default native notification handler
vim.notify = require "notify"

-- 3. Configure noice.nvim
require("noice").setup {
  lsp = {
    -- Override markdown rendering so that hover documentation
    -- and signature help utilize native Tree-sitter parsers
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true, -- Set to true if you want the search bar back at the bottom
    command_palette = true, -- Centers the cmdline panel like a clean workspace search bar
    long_message_to_split = true,
  },
  cmdline = {
    view = "cmdline",
  },
}
