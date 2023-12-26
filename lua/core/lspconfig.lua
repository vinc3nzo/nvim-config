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
      "pylsp",
      "docker_compose_language_service",
      "solargraph",
      "rust_analyzer",
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

  -- SQL --
  lspconfig.sqlls.setup({
    capabilities = capabilities,
  })

  -- Python --
  lspconfig.pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    }
  })

  -- Docker-compose --
  lspconfig.docker_compose_language_service.setup({})

  -- Ruby --
  lspconfig.solargraph.setup({})

  -- Rust --
  lspconfig.rust_analyzer.setup({})

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
