local function config()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
    },
  })

  lspconfig.lua_ls.setup({})
  lspconfig.hls.setup({
    filetypes = { "haskell", "lhaskell", "cabal" },
  })
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
