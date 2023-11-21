return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    
    -- setup
  end
}
