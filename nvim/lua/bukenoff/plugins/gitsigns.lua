local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local wk = require "which-key"

local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map("n", "]c", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })

  map("n", "[c", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })
  -- Actions
  map("n", "<leader>hs", gs.stage_hunk)
  map("n", "<leader>hr", gs.reset_hunk)
  map("v", "<leader>hs", function()
    gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
  end)
  map("v", "<leader>hr", function()
    gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
  end)
  map("n", "<leader>hS", gs.stage_buffer)
  map("n", "<leader>hu", gs.undo_stage_hunk)
  map("n", "<leader>hR", gs.reset_buffer)
  map("n", "<leader>hp", gs.preview_hunk)
  map("n", "<leader>hb", function()
    gs.blame_line { full = true }
  end)
  map("n", "<leader>tb", gs.toggle_current_line_blame)
  map("n", "<leader>hd", gs.diffthis)
  map("n", "<leader>hD", function()
    gs.diffthis "~"
  end)
  map("n", "<leader>td", gs.toggle_deleted)

  -- Text object
  map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

  -- Whickey documentation
  wk.register {
    ["<leader>h"] = { name = "Hunk actions" },
    ["<leader>hs"] = { name = "Stage hunk" },
    ["<leader>hr"] = { name = "Reset hunk" },
    ["<leader>hS"] = { name = "Stage buffer" },
    ["<leader>hu"] = { name = "Undo stage hunk" },
    ["<leader>hR"] = { name = "Reset buffer" },
    ["<leader>hp"] = { name = "Preview hunk" },
    ["<leader>hb"] = { name = "Blame line" },
    ["<leader>tb"] = { name = "Toggle blame line" },
    ["<leader>hd"] = { name = "Diff this" },
    ["<leader>td"] = { name = "Toggle deleted" },
  }
end

gitsigns.setup { on_attach = on_attach }
