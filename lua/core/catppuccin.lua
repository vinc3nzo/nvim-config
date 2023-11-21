local config = {
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    nvimtree = true,
  },
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup(config)
    vim.cmd "colorscheme catppuccin"
  end
}
