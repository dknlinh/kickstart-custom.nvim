local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add {
  gh "mikavilpas/yazi.nvim",
  gh "nvim-lua/plenary.nvim",
}

vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("yazi").setup {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    }
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>", {
  desc = "Open yazi at the current file",
})
vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", {
  desc = "Open the file manager in nvim's working directory",
})
vim.keymap.set("n", "<c-up>", "<cmd>Yazi toggle<cr>", {
  desc = "Resume the last yazi session",
})

