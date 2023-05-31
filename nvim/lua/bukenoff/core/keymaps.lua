vim.g.mapleader = " "

local keymap = vim.keymap
local wk = require "which-key"

-- general
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- split window
wk.register {
  ["<leader>sv"] = { "<C-w>v", "Split vertically" },
  ["<leader>sh"] = { "<C-w>s", "Split horizontally" },
  ["<leader>se"] = { "<C-w>=", "Make split windows equal width and height" },
  ["<leader>sx"] = { ":close<CR>", "Close current split window" },
}

-- tabs
wk.register {
  ["<leader>to"] = { ":tabnew<CR>", "Open new tab" },
  ["<leader>tx"] = { ":tabclose<CR>", "Close current tab" },
  ["L"] = { ":tabn<CR>", "Move to next tab" },
  ["H"] = { ":tabp<CR>", "Move to prev tab" },
}

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
