vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- split window
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "L", ":tabn<CR>")
keymap.set("n", "H", ":tabp<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

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
