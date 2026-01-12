return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  lazy = false,
  config = function()
    local fine_cmdline = require "fine-cmdline"

    fine_cmdline.setup {
      cmdline = {
        enable_keymaps = true,
      },
    }

    vim.keymap.set("n", ":", function()
      fine_cmdline.open()
    end, { noremap = true })
  end,
}
