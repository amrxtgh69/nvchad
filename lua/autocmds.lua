require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local terminal_group = augroup("UserTerminalWorkflow", { clear = true })

local function smart_quit()
  local buf = vim.api.nvim_get_current_buf()

  if vim.bo[buf].buftype ~= "terminal" then
    vim.cmd "quit"
    return
  end

  local job_id = vim.b[buf].terminal_job_id
  if type(job_id) == "number" and job_id > 0 then
    pcall(vim.fn.jobstop, job_id)
  end

  pcall(vim.cmd, "bdelete!")
end

vim.api.nvim_create_user_command("SmartQuit", smart_quit, { desc = "Quit terminal safely or quit normal window" })

autocmd("TermOpen", {
  group = terminal_group,
  pattern = "*",
  callback = function(args)
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = args.buf, desc = "Terminal normal mode" })
    vim.keymap.set({ "n", "t" }, "<leader>q", smart_quit, { buffer = args.buf, desc = "Smart quit terminal" })
  end,
})

vim.cmd [[
  cnoreabbrev <expr> q (getcmdtype() ==# ':' && getcmdline() ==# 'q' && &buftype ==# 'terminal') ? 'SmartQuit' : 'q'
]]
