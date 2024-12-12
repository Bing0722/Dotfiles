return {
  -- change window style and default mapping action
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
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
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
