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
-- Normal-mode commands
keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

-- Gitui
keymap.set("n", "<leader>gg", ":Gitui<CR>", opts)
