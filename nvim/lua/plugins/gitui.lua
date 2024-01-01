return {
  "aspeddro/gitui.nvim",
  keys = {
    { "<leader>gg", "<cmd>Gitui<CR>", desc = "Open gitui interface" },
  },
  config = function()
    require("gitui").setup {
      command = {
        enable = true,
      },
      binary = "gitui",
      args = {},
      window = {
        options = {
          width = 90,
          height = 80,
          border = "rounded",
        },
      },
    }
  end,
}
