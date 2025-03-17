-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.showbreak = "↪"
opt.scrolloff = 8 -- 保证光标距离上下各8行

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
_G.browser = "Firefox"

vim.g.lazyvim_blink_main = false

-- set picker
vim.g.lazyvim_picker = "snacks"
