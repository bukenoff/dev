return {
  "folke/twilight.nvim",
  opts = {},
  config = function()
    require("twilight").setup {
      treesitter = true,
      expand = {
        "function",
        "method",
        "class",
        "if_statement",
        "for_statement",
        "while_statement",
      },
    }
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", opts)
  end,
}
