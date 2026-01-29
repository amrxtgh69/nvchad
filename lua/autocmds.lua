require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    pcall(function()
      require("configs.mdcat").refresh()
    end)
  end,
})
