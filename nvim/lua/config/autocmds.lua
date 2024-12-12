-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

------------- Disable autoformat for some files -----------
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "conf" },
  callback = function()
    vim.b.autoformat = false
  end,
})

------------------- Disable spelling check ----------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.opt.autochdir = true
  end,
})

------------------- markdown_table_format -----------------
local group = vim.api.nvim_create_augroup("Coding", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  pattern = "*.md",
  callback = function()
    require("internal.markdown_table_format").format_markdown_table()
  end,
})
vim.api.nvim_create_autocmd("TextChangedI", {
  group = group,
  pattern = "*.md",
  callback = function()
    require("internal.markdown_table_format").format_markdown_table_lines()
  end,
})

-----------------------------------------------------------
