return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim", -- nui 是 noice 依赖的 UI 库
      "rcarriga/nvim-notify", -- 这里依赖 notify 插件，用于通知显示
    },
    opts = {
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
      cmdline = {
        view = "cmdline_popup",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true, -- 启用 LSP 文档的边框效果
      },
      messages = {
        -- 启用消息 UI 时，命令行 (cmdline) 会被自动启用。这是 Neovim 当前的限制。
        enabled = true, -- 是否启用 Noice 消息 UI，默认值为 `true`
        view = "notify", -- 默认用于显示所有普通消息的视图，这里使用 `notify`
        view_error = "notify", -- 用于显示错误消息的视图，设置为 `notify`
        view_warn = "notify", -- 用于显示警告消息的视图，设置为 `notify`
        view_history = "messages", -- 用于 `:messages` 命令的视图，显示消息历史。设置为 `messages` 视图
        view_search = "virtualtext", -- 用于显示搜索计数消息（例如 `/pattern` 搜索时的结果计数）
        -- view_search = "notify",
        -- view_history = "notify",
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      lsp = {
        progress = {
          enabled = true, -- 启用 LSP 进度显示
          format = "lsp_progress", -- 设置 LSP 进度格式。可以是一个字符串（如 "lsp_progress"），或一个自定义格式
          format_done = "lsp_progress_done", -- 设置 LSP 完成后的进度格式
          throttle = 1000 / 30, -- LSP 进度更新频率（每秒 30 次）
          view = "mini", -- 显示进度的视图。`mini` 表示小型的进度条显示方式
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true, -- 启用悬浮提示
          silent = false, -- 设置为 `true` 时，悬浮提示不可用时不会显示消息
          view = nil, -- 默认为文档视图
          opts = {}, -- 合并默认文档视图选项
        },
        signature = {
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
