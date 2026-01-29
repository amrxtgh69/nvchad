local M = {}

M.open = function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("terminal mdcat " .. vim.fn.expand("%"))
  vim.cmd("startinsert")
end

M.refresh = function()
  vim.cmd("wincmd l")
  vim.cmd("normal! G")
  vim.cmd("normal! dG")
  vim.cmd("terminal mdcat " .. vim.fn.expand("%"))
end

return M