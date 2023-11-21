return {
  "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup()
  end
}
