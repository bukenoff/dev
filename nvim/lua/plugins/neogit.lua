return {
  "NeogitOrg/neogit",
  keys = {
    { "<leader>gt", ":Neogit<CR>", desc = "Open neogit" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",
  },
  config = function()
    require("neogit").setup {}

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>gt", ":Neogit<CR>", opts)
  end,
}
