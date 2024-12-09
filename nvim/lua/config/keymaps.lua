-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- 为 insert 模式设置 esc 映射
map("i", "jj", "<esc>", { desc = "快速退出插入模式" })
map("i", "jk", "<esc>", { desc = "快速退出插入模式" })

-- 使用 vim.keymap.set 将快捷键映射到 accelerated-jk 的功能
-- map("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "快速向下移动" })
-- map("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "快速向上移动" })

-- Sniprun 运行代码片段
map("v", "<leader><CR>", ":SnipRun<CR>", { desc = "运行代码片段" })

-- 禁用 q 键的录制宏功能
vim.api.nvim_set_keymap("n", "q", ':echo "录制宏功能已被禁用." <CR>', { noremap = true, silent = true })

-- 自定义快捷键，在括号或引号内跳出
vim.api.nvim_set_keymap("i", "<C-e>", "<Esc>la", { noremap = true, silent = true })

local ToggleMapping = require("config.function.toggle")
map({ "n", "t" }, "<F9>", function()
  ToggleMapping.toggleA()
end, { noremap = true, silent = true, desc = "Toggle Float Terminal" })

map({ "n", "t" }, "<F10>", function()
  ToggleMapping.toggleB()
end, { noremap = true, silent = true, desc = "Toggle Vertical Terminal" })

map({ "n", "t" }, "<F11>", function()
  ToggleMapping.toggleC()
end, { noremap = true, silent = true, desc = "Toggle Horizontal Terminal" })

map({ "n", "t" }, "<F12>", function()
  ToggleMapping.toggleG()
end, { noremap = true, silent = true, desc = "Toggle Lazygit" })
