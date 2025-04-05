-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

------------------- General Keymaps -----------------------
-- 为 insert 模式设置 esc 映射
map("i", "jj", "<esc>", { desc = "快速退出插入模式" })
map("i", "jk", "<esc>", { desc = "快速退出插入模式" })

-- 使用 vim.keymap.set 将快捷键映射到 accelerated-jk 的功能
-- map("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "快速向下移动" })
-- map("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "快速向上移动" })

-- 禁用 q 键的录制宏功能
vim.api.nvim_set_keymap("n", "q", ':echo "录制宏功能已被禁用." <CR>', { noremap = true, silent = true })

-------------------- OverseerRun --------------------------
map("n", "<F5>", ":OverseerRun<CR>", { desc = "run task" })

------------------------- kulala --------------------------
-- 发送请求
map("n", "<F8>", "<cmd>lua require('kulala').run()<cr>", { desc = "send the request" })
