local function config()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "sqlls",
    },
  })

  -- Lua --
  lspconfig.lua_ls.setup({})

  -- Haskell --
  lspconfig.hls.setup({
    filetypes = { "haskell", "lhaskell", "cabal" },
  })

  -- SQL (Postgres)
  lspconfig.sqlls.setup({})

  -- display documentation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  dependencies = {
    "mason-lspconfig",
    "mason",
  },
  config = config,
}
