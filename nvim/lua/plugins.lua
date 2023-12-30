return {
  "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "vim-scripts/ReplaceWithRegister",
  -- time tracking
  "wakatime/vim-wakatime",
  -- which key
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      }
    end,
  },
}
