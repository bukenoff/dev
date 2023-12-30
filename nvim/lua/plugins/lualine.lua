return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local base16_theme = require "lualine.themes.base16"
    require("lualine").setup({
      options = {
        theme = base16_theme
      }
    })
  end,
}
