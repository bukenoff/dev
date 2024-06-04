return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>dvo", ":DiffviewOpen<CR>", desc = "Open diffview" },
  },
  dependencies = {
    "sindrets/diffview.nvim",
  },
  config = function()
    require("diffview").setup {}

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", opts)
    vim.keymap.set("n", "<leader>dvx", ":DiffviewClose<CR>", opts)
  end,
}
