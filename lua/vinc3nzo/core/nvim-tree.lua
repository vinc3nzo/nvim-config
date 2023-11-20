return {
  "nvim-tree/nvim-tree.lua",
  name = "nvim-tree",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- disable netrw file manager
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
    })
  end,
}

