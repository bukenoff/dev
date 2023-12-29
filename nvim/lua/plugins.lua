return {
 "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "vim-scripts/ReplaceWithRegister",
  "kyazdani42/nvim-web-devicons",
  -- autocomplete
   "hrsh7th/nvim-cmp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
  -- snippets
   "L3MON4D3/LuaSnip",
   "saadparwaiz1/cmp_luasnip",
   "rafamadriz/friendly-snippets",
  -- manage and install lsp servers
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
  -- configure lsp servers
   "neovim/nvim-lspconfig",
   "hrsh7th/cmp-nvim-lsp",
   "jose-elias-alvarez/typescript.nvim",
   "onsails/lspkind.nvim",
  -- format and lint
   "jose-elias-alvarez/null-ls.nvim",
   "jayp0521/mason-null-ls.nvim",
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
