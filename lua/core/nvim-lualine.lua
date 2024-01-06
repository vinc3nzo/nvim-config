return {
  "nvim-lualine/lualine.nvim",
  name = "lualine",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = {
          left = "",
          right = "",
        },
        section_separators = {
          left = "",
          right = "",
        },
        globalstatus = false,
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"filename"},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        -- lualine_y = {'progress'},
        -- lualine_z = {'location'}
        lualine_x = {
          { "diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "} },
          "encoding",
          "filetype"
        },
        lualine_y = {"progress"},
        lualine_z = {"location"},
      },
    })
  end,
}
