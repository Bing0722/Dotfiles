-- 终端

-- 定义 Terminal 实例
local Terminal = require("toggleterm.terminal").Terminal

-- 定义浮动终端
local ta = Terminal:new({
  direction = "float", -- 浮动窗口
})

-- 定义垂直终端
local tb = Terminal:new({
  direction = "vertical", -- 垂直窗口
})

-- 定义水平终端
local tc = Terminal:new({
  direction = "horizontal", -- 水平窗口
})

-- 定义 lazygit 终端
local tg = Terminal:new({
  cmd = "lazygit", -- 这里设置 lazygit 作为命令
  direction = "float", -- 你可以根据需要设置为浮动窗口
  close_on_exit = true, -- 终端退出时关闭
})

-- 定义功能模块
local M = {}

-- 切换浮动终端
M.toggleA = function()
  if ta:is_open() then
    ta:close()
    return
  end
  tb:close()
  tc:close()
  ta:open()
end

-- 切换垂直终端
M.toggleB = function()
  if tb:is_open() then
    tb:close()
    return
  end
  ta:close()
  tc:close()
  tb:open()
end

-- 切换水平终端
M.toggleC = function()
  if tc:is_open() then
    tc:close()
    return
  end
  ta:close()
  tb:close()
  tc:open()
end

-- 切换 lazygit 终端
M.toggleG = function()
  if tg:is_open() then
    tg:close()
    return
  end
  ta:close()
  tb:close()
  tc:close()
  tg:open()
end

-- 键位绑定
-- 按 <F9>  打开/关闭浮动终端
-- 按 <F10> 打开/关闭垂直终端
-- 按 <F11> 打开/关闭水平终端
-- 按 <F12> 打开/关闭lazygit终端
M.mapToggleTerm = function()
  vim.keymap.set({ "n", "t" }, "<F9>", function()
    M.toggleA()
  end, { noremap = true, silent = true, desc = "Toggle Float Terminal" })
  vim.keymap.set({ "n", "t" }, "<F10>", function()
    M.toggleB()
  end, { noremap = true, silent = true, desc = "Toggle Vertical Terminal" })
  vim.keymap.set({ "n", "t" }, "<F11>", function()
    M.toggleC()
  end, { noremap = true, silent = true, desc = "Toggle Horizontal Terminal" })
  vim.keymap.set({ "n", "t" }, "<F12>", function()
    M.toggleG()
  end, { noremap = true, silent = true, desc = "Toggle Lazygit" })
end
return M
