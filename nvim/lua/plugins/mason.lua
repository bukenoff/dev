return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_null_ls = require "mason-null-ls"

    mason.setup()

    mason_lspconfig.setup {
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "gopls",
        "clangd",
      },
      automatic_installation = true,
    }

    mason_null_ls.setup {
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
        "rust_analyzer",
      },
      automatic_installation = true,
    }
  end,
}
