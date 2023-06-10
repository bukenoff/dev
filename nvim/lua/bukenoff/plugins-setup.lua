-- install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- update plugins on save
vim.cmd [[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- packer stuff
  use "nvim-lua/plenary.nvim" -- lua functions for other plugins
  use "bluz71/vim-nightfly-guicolors" -- colorscheme
  use "christoomey/vim-tmux-navigator" -- tmux & split window navigation
  use "vim-scripts/ReplaceWithRegister"
  use "nvim-tree/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  -- fuzzy finding and telescope
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
  -- autocomplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  -- manage and install lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- configure lsp servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use { "glepnir/lspsaga.nvim", branch = "main" }
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind.nvim"
  -- format and lint
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }
  -- auto closing
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  -- git signs
  use "lewis6991/gitsigns.nvim"
  -- time tracking
  use "wakatime/vim-wakatime"
  -- comment
  use "numToStr/Comment.nvim"

  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        -- config
      }
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  -- move lines
  use "fedepujol/move.nvim"
  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  use {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
