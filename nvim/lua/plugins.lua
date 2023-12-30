return {
 "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "vim-scripts/ReplaceWithRegister",
  -- git signs
   "lewis6991/gitsigns.nvim",
  -- time tracking
   "wakatime/vim-wakatime",
  -- comment
   "numToStr/Comment.nvim",
  -- move lines
   "fedepujol/move.nvim",
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
