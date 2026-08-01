return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      local function getOptions(description)
        return { noremap = true, silent = true, buffer = bufnr, desc = description }
      end

      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      keymap.set("n", "<leader>cda", vim.lsp.buf.code_action, getOptions "Code actions")
      keymap.set({ "n", "v" }, "<leader>cda", vim.lsp.buf.code_action, getOptions "Code actions")
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      keymap.set("n", "[d", function()
        vim.diagnostic.jump { count = -1, float = true }
      end, opts)
      keymap.set("n", "]d", function()
        vim.diagnostic.jump { count = 1, float = true }
      end, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    }

    lspconfig["html"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["jdtls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["clangd"].setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
      cmd = { "clangd", "--background-index" },
      single_file_support = true,
      root_dir = lspconfig.util.root_pattern(
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
      ),
    }

    lspconfig["ts_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern ".git",
    }

    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["tailwindcss"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }

    lspconfig["gopls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
        },
      },
    }

    lspconfig["rust_analyzer"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = {
        "rustup",
        "run",
        "stable",
        "rust-analyzer",
      },
    }

    lspconfig["biome"].setup {
      single_file_support = false,
      on_attach = on_attach,
    }
  end,
}
