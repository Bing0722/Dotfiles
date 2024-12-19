-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

------------------- General Keymaps -------------------
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

--------------------- ToggleMapping --------------------
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

------------------------ 运行程序 ------------------------

map("n", "<F5>", function()
  local view = require("config.function.run_code")
  local filetype = vim.bo.filetype
  local output_file = vim.fn.expand("%:p:r") .. ".out"

  if filetype == "cpp" or filetype == "c" then
    if vim.fn.filereadable(output_file) == 0 then
      vim.notify("未找到可执行文件! 请先编译代码.", "error", { title = "Run Program" })
      view.compile(filetype)
      return
    end
  end
  view.run(filetype)
end, { noremap = true, silent = true, desc = "运行一些简单的脚本和程序" })

--------------------- 预览Markdown文件---------------------
-- 设置快捷键 F4 来打开 Markdown 文件
map("n", "<F4>", function()
  -- 获取当前文件路径
  local filename = vim.fn.expand("%:p")

  -- 判断当前文件是否是 Markdown 文件
  if vim.fn.expand("%:e") == "md" then
    -- 输出调试信息
    print("Opening markdown file in Typora: " .. filename)

    -- 执行 Typora 打开该文件
    vim.fn.jobstart('typora "' .. filename .. '"', {
      on_stdout = function(_, data)
        print("Output: " .. table.concat(data, "\n"))
      end,
      on_stderr = function(_, data)
        print("Error: " .. table.concat(data, "\n"))
      end,
    })
  else
    -- 如果当前文件不是 markdown 文件，输出提示
    print("Current file is not a markdown file.")
  end
end, { desc = "Open markdown file in Typora" })

------------------- Overseer ------------------------------
map("n", "<F2>", ":OverseerRun<CR>", { desc = "run task" })
