-- 1. Create a unique workspace cache per project folder
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "cache" .. "/jdtls/workspace/" .. project_name

-- 2. Define the server configuration
local config = {
  cmd = {
    -- Uses the Mason-installed executable wrapper automatically
    vim.fn.exepath "jdtls",
    "-data",
    workspace_dir,
  },

  -- Automatically locate the root of your Java repository
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  settings = {
    java = {},
  },
}

-- 3. Start or attach the client to the active buffer
require("jdtls").start_or_attach(config)
