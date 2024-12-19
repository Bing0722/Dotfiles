-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

---@diagnostic disable-next-line: unused-local
local opt = vim.opt

-- 如果你不想使用 `:LazyExtras`，
-- 那么你需要设置下面的选项。
-- vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_picker = "fzf"

-- 用于 Rust 的 LSP 服务器。
-- 设置为 "bacon-ls" 以使用 bacon-ls 而不是 rust-analyzer。
-- 仅用于诊断，其他 LSP 支持仍将由 rust-analyzer 提供。
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- 用于 Python 的 LSP 服务器。
-- 设置为 "basedpyright" 以使用 basedpyright 而不是 pyright。
vim.g.lazyvim_python_lsp = "pyright"

-- 设置为 "ruff_lsp" 以使用旧版的 LSP 实现。
vim.g.lazyvim_python_ruff = "ruff"

-- vim.g.lazyvim_blink_main = true
------------------- General settings -------------------
-- _G.browser = "Google Chrome"
_G.browser = "Firefox"

-- opt.list = true
-- opt.listchars = "tab:→→,nbsp:·,trail:~,extends:→,precedes:←,eol:↲"

opt.showbreak = "↪"
-- 在 LazyVim 中确保底部留有空白
opt.scrolloff = 8 -- 保证光标距离上下各8行
opt.sidescrolloff = 4 -- 保证左右也有空间
