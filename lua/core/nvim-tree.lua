local function on_attach()
  local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '<C-e>', api.tree.toggle, opts('Toggle Tree'))
end

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
      on_attach = on_attach,
    })
  end,
}

