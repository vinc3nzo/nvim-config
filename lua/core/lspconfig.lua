local function on_attach(client, bufnr)
  local opts = { buffer = bufnr }

  -- display documentation
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
end

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
      "typst_lsp",
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
    capabilities = capabilities,
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
  lspconfig.docker_compose_language_service.setup({
    capabilities = capabilities,
  })

  -- Ruby --
  lspconfig.solargraph.setup({
    capabilities = capabilities,
  })

  -- Rust --
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
      ['rust_analyzer'] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  })

  -- Typst 
  lspconfig.typst_lsp.setup({
    capabilities = capabilities,
  })
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
  on_attach = on_attach,
}
