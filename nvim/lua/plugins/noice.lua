return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim", -- nui 是 noice 依赖的 UI 库
      "rcarriga/nvim-notify", -- 这里依赖 notify 插件，用于通知显示
    },
    opts = {
      presets = {
        lsp_doc_border = true, -- 为悬停文档和签名帮助添加边框
      },
      views = {
        notify = {
          -- backend = { "notify", "snacks" },
          backend = { "notify" },
          fallback = "mini",
          format = "notify",
          replace = false,
          merge = false,
        },
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      messages = {
        -- 启用消息 UI 时，命令行 (cmdline) 会被自动启用。这是 Neovim 当前的限制。
        enabled = true, -- 是否启用 Noice 消息 UI，默认值为 `true`
        view = "notify", -- 默认用于显示所有普通消息的视图，这里使用 `notify`
        view_error = "notify", -- 用于显示错误消息的视图，设置为 `notify`
        view_warn = "notify", -- 用于显示警告消息的视图，设置为 `notify`
        view_history = "messages", -- 用于 `:messages` 命令的视图，显示消息历史。设置为 `messages` 视图
        view_search = "virtualtext", -- 用于显示搜索计数消息（例如 `/pattern` 搜索时的结果计数）
      },
      lsp = {
        signature = {
          enabled = true,
          auto_open = {
            enabled = true, -- 自动打开签名帮助
            trigger = true, -- 输入触发字符时自动显示签名帮助
            luasnip = true, -- 跳转到 Luasnip 插入节点时显示签名帮助
            throttle = 50, -- LSP 签名帮助请求的去抖动延时（50ms）
          },
          view = nil, -- 默认为文档视图
          opts = {
            -- 签名窗口的配置
            size = {
              height = 8, -- 设置窗口的高度
              width = 80, -- 设置窗口的宽度
            },
            win_options = {
              winblend = 0,
            },
            floating = true, -- 确保签名窗口为浮动窗口
          },
        },
      },
    },
  },
}
