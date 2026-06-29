local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add {
  gh "folke/snacks.nvim",
  gh "echasnovski/mini.icons",
}

require("snacks").setup {
  dashboard = {
    -- enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
      -- {
      --   section = "terminal",
      --   cmd = "",
      --   random = 15,
      --   pane = 2,
      --   indent = 15,
      --   height = 25,
      -- },
    },
  },
  lazygit = {},
}

vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
