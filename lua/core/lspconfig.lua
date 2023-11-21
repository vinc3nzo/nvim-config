local function config()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "sqlls",
    },
  })

  -- Lua --
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
  })

  -- Haskell --
  lspconfig.hls.setup({
    capabilities = capabilities,
    filetypes = { "haskell", "lhaskell", "cabal" },
  })

  -- SQL (Postgres)
  lspconfig.sqlls.setup({
    capabilities = capabilities,
  })

  -- display documentation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  dependencies = {
    "mason-lspconfig",
    "mason",
    "hrsh7th/nvim-cmp",
  },
  config = config,
}
