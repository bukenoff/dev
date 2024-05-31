return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    require("neogit").setup {}

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", opts)
    vim.keymap.set("n", "<leader>dvx", ":DiffviewClose<CR>", opts)
    vim.keymap.set("n", "<leader>gt", ":Neogit<CR>", opts)
  end,
}
