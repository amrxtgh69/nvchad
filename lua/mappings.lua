require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Disable bad defaults
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Navigation + view
map("n", "<Tab>", "<cmd>:bn<cr>", { desc = "Goto next buffer" })
map("n", "<S-Tab>", "<cmd>:bp<cr>", { desc = "Goto previous buffer" })

map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

map("n", "<C-u>", "<C-u>zz", { desc = "Move half page up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move half page down and center" })

-- Clipboard + delete
map("n", "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("v", "<leader>y", [["+y]], { desc = "Yank to system clipboard (visual)" })
map("n", "<leader>d", [["_d]], { desc = "Delete without yanking" })
map("v", "<leader>d", [["_d]], { desc = "Delete without yanking (visual)" })
map("x", "<leader>p", [["_dP]], { desc = "Paste over without losing clipboard" })

map({ "n", "v" }, "<C-S-c>", [["+y]], { desc = "Copy to system clipboard (Ctrl+Shift+C)" })
map("n", "<C-S-v>", [["+p]], { desc = "Paste from system clipboard (Ctrl+Shift+V)" })
map("v", "<C-S-v>", '"_d"+P', { desc = "Paste from system clipboard without losing it (Ctrl+Shift+V)" })
map("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard in insert mode (Ctrl+Shift+V)" })

-- Windows + splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })

-- Files + tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
nomap("n", "<C-n>")

map("n", "<leader>cx", "<cmd>!chmod +x %<cr>", { desc = "Make current file executable", silent = true })

-- Telescope
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "View buffers" })
map(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope.builtin').live_grep{ search_dirs={'%:p'} }<CR>",
  { desc = "Grep in current buffer" }
)

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- map("n", "<leader>k", function()
--   local ok, start = require("indent_blankline.utils").get_current_context(
--     vim.g.indent_blankline_context_patterns,
--     vim.g.indent_blankline_use_treesitter_scope
--   )
--   if ok then
--     vim.api.nvim_win_set_cursor(0, { start, 0 })
--     vim.cmd.normal { "_", bang = true }
--   end
-- end, { desc = "Jump to current indent context" })

-- Cargo run project
map("n", "<leader>cc", function()
  require("nvterm.terminal").send("cargo run", "horizontal")
end, { desc = "Cargo run in horizontal terminal" })

-- Rustc compile + run
map("n", "<leader>cr", function()
  local file_path = vim.fn.expand "%"
  local filename = vim.fn.expand("%:t"):match "^([^.]+)"
  require("nvterm.terminal").send("clear && rustc " .. file_path .. " && ./" .. filename, "horizontal")
end, { desc = "Rustc compile and run" })

-- Python run
map("n", "<leader>pc", function()
  local file_path = vim.fn.expand "%"
  require("nvterm.terminal").send("python3 " .. file_path, "horizontal")
end, { desc = "Run python file in terminal" })

-- C++ compile + run
map("n", "<leader>gp", function()
  local file_path = vim.fn.expand "%"
  local filename = vim.fn.expand("%:t"):match "^([^.]+)" .. ".out"
  require("nvterm.terminal").send(
    "clear && g++ -o " .. filename .. " '" .. file_path .. "' && ./" .. filename,
    "horizontal"
  )
end, { desc = "G++ compile and run" })

-- C compile + run
map("n", "<leader>gc", function()
  local file_path = vim.fn.expand "%"
  local filename = vim.fn.expand("%:t:r") .. ".out"
  require("nvterm.terminal").send(
    "clear && gcc -Wall -Wextra '" .. file_path .. "' -o " .. filename .. " && ./" .. filename,
    "horizontal"
  )
end, { desc = "GCC compile and run" })
