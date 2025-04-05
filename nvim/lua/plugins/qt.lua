-- 在 LazyVim 中，确保 neoconf 是在设置任何 LSP 之前加载的
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          cmd = { "qmlls6" }, -- 使用正确的命令 qmlls6
          filetypes = { "qml", "qmljs" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) -- 找到 Git 根目录
          end,
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          single_file_support = true,
        },
      },
    },
  },

  -- 配置 qmlformat 作为格式化工具
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        qml = { "qmlformat" },
      },
      formatters = {
        -- 新增 qmlformat 定义
        qmlformat = {
          command = "qmlformat", -- 或使用动态路径检测
          args = { "-i", "$FILENAME" }, -- 不要使用 -i 参数
          stdin = false, -- 需要文件路径
          cwd = require("conform.util").root_file({ ".git" }), -- 根据项目根目录执行
          condition = function(ctx)
            -- 仅在 qmlformat 可执行时启用
            return vim.fn.executable(ctx.command) == 1
          end,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "qmljs" }, -- 确保安装 QML
      highlight = { enable = true },
      -- 手动定义 QML 解析器
      custom_parsers = {
        qml = {
          install_info = {
            url = "https://github.com/Decodetalkers/tree-sitter-qmljs", -- 官方维护的 QML 解析器仓库
            files = { "src/parser.c", "src/scanner.c" }, -- 关键文件
            branch = "master",
            generate_requires_npm = true, -- 需要 npm 生成解析器
          },
          filetype = "qml",
        },
      },
    },
  },

  -- 文件类型图标
  {
    "echasnovski/mini.icons",
    opts = {
      filetype = {
        qml = { glyph = "󰟇", hl = "MiniIconsGreen" },
      },
    },
  },
}
