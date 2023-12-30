vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- split window
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal height and width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split window" })

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "L", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "H", ":tabp<CR>", { desc = "Prev tab" })

-- move lines
local opts = { noremap = true, silent = true }
-- Gitui
keymap.set("n", "<leader>gg", ":Gitui<CR>", opts)
