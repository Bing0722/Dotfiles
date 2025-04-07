-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

if not vim.g.vscode then
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

  -------------------- Auto chdir ---------------------------
  -- vim.api.nvim_create_autocmd("BufReadPost", {
  --   pattern = "*",
  --   callback = function()
  --     vim.opt.autochdir = true
  --   end,
  -- })
  ------------------------ qss ------------------------------
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.qss",
    callback = function()
      vim.bo.filetype = "css" -- 或者你可以创建一个自定义 filetype
    end,
  })

  ------------------------ qrc ------------------------------
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.qrc",
    callback = function()
      vim.bo.filetype = "xml"
    end,
  })
end
