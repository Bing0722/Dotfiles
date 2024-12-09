return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
    ██████╗ ██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ██╔══██╗██║████╗  ██║██╔════╝ ██║   ██║██║████╗ ████║
    ██████╔╝██║██╔██╗ ██║██║  ███╗██║   ██║██║██╔████╔██║
    ██╔══██╗██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██████╔╝██║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
  -- change window style and default mapping action
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- 确保插件已加载所需模块
      local cmp = require("cmp")
      -- 自定义按键映射
      opts.mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认补全
        ["<tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- 选择下一个补全项
          else
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end
        end,
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- 补全窗口可见时选择上一个
          else
            fallback() -- 否则执行默认行为
          end
        end, { "i", "s" }),
      })
      opts.window = {
        completion = {
          border = "rounded", -- 补全窗口边框样式
          scrollbar = true, -- 显示滚动条
        },
        documentation = {
          border = "rounded", -- 文档窗口边框样式
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- 启用 LSP 文档的边框效果
      },
      lsp = {
        signature = {
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
