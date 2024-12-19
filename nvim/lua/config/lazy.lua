local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- ai 插件
    -- { import = "lazyvim.plugins.extras.ai.tabnine" }, -- ai补全
    -- { import = "lazyvim.plugins.extras.ai.codeium" },

    -- coding 插件
    -- { import = "lazyvim.plugins.extras.coding.luasnip" }, -- 可以自定义代码片段
    -- { import = "lazyvim.plugins.extras.coding.neogen" }, -- 生产doxygen
    -- { import = "lazyvim.plugins.extras.coding.mini-surround" }, -- 代码包围
    -- { import = "lazyvim.plugins.extras.coding.mini-comment" }, -- 注释
    -- { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
    -- { import = "lazyvim.plugins.extras.coding.blink" },

    -- editor 插件
    -- { import = "lazyvim.plugins.extras.editor.illuminate" }, -- 高亮相同单词
    -- { import = "lazyvim.plugins.extras.editor.mini-diff" }, -- 显示差异
    -- { import = "lazyvim.plugins.extras.editor.mini-files" }, -- 文件
    -- { import = "lazyvim.plugins.extras.editor.telescope" }, -- 增强搜索
    -- { import = "lazyvim.plugins.extras.editor.refactoring" }, -- 重构
    -- { import = "lazyvim.plugins.extras.editor.overseer" }, -- 任务管理
    -- { import = "lazyvim.plugins.extras.editor.outline" }, -- 大纲

    -- formatting 插件
    -- { import = "lazyvim.plugins.extras.formatting.black" }, -- python格式化

    -- lang 插件
    -- { import = "lazyvim.plugins.extras.lang.clangd" }, -- c++/c
    -- { import = "lazyvim.plugins.extras.lang.cmake" }, -- cmake
    -- { import = "lazyvim.plugins.extras.lang.docker" }, -- docker
    -- { import = "lazyvim.plugins.extras.lang.git" }, -- git
    -- { import = "lazyvim.plugins.extras.lang.go" }, -- go
    -- { import = "lazyvim.plugins.extras.lang.java" }, -- java
    -- { import = "lazyvim.plugins.extras.lang.json" }, -- json
    -- { import = "lazyvim.plugins.extras.lang.markdown" }, -- markdown
    -- { import = "lazyvim.plugins.extras.lang.python" }, -- python
    -- { import = "lazyvim.plugins.extras.lang.rust" }, -- rust
    -- { import = "lazyvim.plugins.extras.lang.yaml" }, -- yaml

    -- lsp 插件
    -- { import = "lazyvim.plugins.extras.lsp.neoconf" }, -- 配置管理工具
    -- { import = "lazyvim.plugins.extras.lsp.none-ls" }, -- 将非LSP工具集成到Neovim 中

    -- ui 插件
    -- { import = "lazyvim.plugins.extras.ui.mini-indentscope" }, -- 缩进
    -- { import = "lazyvim.plugins.extras.ui.smear-cursor" }, -- 丝滑的光标(二选一)
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" }, -- 丝滑的跳转(二选一)

    -- util 插件
    -- { import = "lazyvim.plugins.extras.util.dot" }, -- dotfile 支持
    -- { import = "lazyvim.plugins.extras.util.gitui" }, -- git ui
    -- { import = "lazyvim.plugins.extras.util.mini-hipatterns" }, -- 提供高亮模式匹配功能
    -- { import = "lazyvim.plugins.extras.util.startuptime" }, -- 诊断性能瓶颈
    -- { import = "lazyvim.plugins.extras.util.project" }, -- 项目管理
    -- { import = "lazyvim.plugins.extras.util.rest" }, -- HTTP 请求的处理和测试
    -- { import = "lazyvim.plugins.extras.util.chezmoi" }, -- dotfile 管理
    --
    -- { import = "lazyvim.plugins.extras.test.core" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
