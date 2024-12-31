local opt = vim.opt
local o = vim.o
local g = vim.g

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

g.mapleader = " "
g.maplocalleader = " "

------------------------ options ---------------------
o.laststatus = 3 -- 始终显示状态栏
o.showmode = false -- 不显示当前模式

o.clipboard = "unnamedplus" -- 使用系统剪贴板
o.cursorline = true -- 高亮当前行
o.cursorlineopt = "number" -- 仅高亮行号

-- Indenting
o.expandtab = true -- 将制表符转换为空格
o.shiftwidth = 2 -- 缩进时插入两个空格
o.smartindent = true -- 自动智能缩进
o.tabstop = 2 -- 一个制表符等于两个空格
o.softtabstop = 2 -- 退格符删除两个空格

opt.fillchars = { eob = " " } -- 用空格填充行尾
o.ignorecase = true -- 搜索时忽略大小写
o.smartcase = true -- 当搜索包含大写字母时，强制匹配大小写
o.mouse = "a" -- 启用鼠标

-- Numbers
o.number = true -- 显示行号
o.numberwidth = 2 -- 行号宽度为2
o.ruler = false -- 不显示标尺
o.relativenumber = true -- 显示相对行号
o.scrolloff = 10 -- 距离屏幕上下部分距离

-- disable nvim intro
opt.shortmess:append("sI") -- 禁用 nvim 启动时的介绍信息

o.signcolumn = "yes" -- 始终显示符号列
o.splitbelow = true -- 新窗口在下方打开
o.splitright = true -- 新窗口在右侧打开
o.timeoutlen = 400 -- 映射超时时间为400毫秒
o.undofile = true -- 启用撤销文件

o.updatetime = 250 -- 写入交换文件到磁盘的时间间隔，也用于 gitsigns

opt.wrap = false -- Disable line wrap

opt.whichwrap:append("<>[]hl") -- 当光标到达行尾/行首时，使用 h, l, 左箭头和右箭头移动到上一行/下一行

-- disable some default providers
g.loaded_node_provider = 0 -- 禁用默认的 Node.js 提供者
g.loaded_python3_provider = 0 -- 禁用默认的 Python3 提供者
g.loaded_perl_provider = 0 -- 禁用默认的 Perl 提供者
g.loaded_ruby_provider = 0 -- 禁用默认的 Ruby 提供者

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0 -- 检查是否为 Windows 系统
local sep = is_windows and "\\" or "/" -- 根据系统选择路径分隔符
local delim = is_windows and ";" or ":" -- 根据系统选择路径分隔符
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH -- 将 mason.nvim 安装的二进制文件添加到路径
