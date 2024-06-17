return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require "harpoon"

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    harpoon.setup()

    vim.keymap.set("n", "<A-1>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<A-2>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<A-3>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<A-4>", function()
      harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<A-5>", function()
      harpoon:list():select(5)
    end)
    vim.keymap.set("n", "<A-6>", function()
      harpoon:list():select(6)
    end)

    vim.keymap.set("n", "<leader><A-1>", function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set("n", "<leader><A-2>", function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set("n", "<leader><A-3>", function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set("n", "<leader><A-4>", function()
      harpoon:list():replace_at(4)
    end)
    vim.keymap.set("n", "<leader><A-5>", function()
      harpoon:list():replace_at(5)
    end)
    vim.keymap.set("n", "<leader><A-6>", function()
      harpoon:list():replace_at(6)
    end)
  end,
}
