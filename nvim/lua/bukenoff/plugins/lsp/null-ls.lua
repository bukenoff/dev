local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    formatting.prettier.with {
      disabled_filetypes = { "json", "yaml" },
    },
    formatting.stylua,
    diagnostics.eslint_d,
    code_actions.eslint_d,
    code_actions.gitsigns,
  },
  on_attach = function(current_client, bufnr)
    if current_client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            filter = function(client)
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}
