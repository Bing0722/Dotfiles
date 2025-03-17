return {
  "saghen/blink.cmp",
  -- dependencies = { "hrsh7th/cmp-emoji" },
  opts = {
    completion = {
      trigger = {
        -- 在字符后面是否显示补全
        show_on_trigger_character = true,
        -- 控制被阻止的触发字符
        show_on_blocked_trigger_characters = { " ", "\n", "\t", "," },
        -- 在插入模式下 下面字符后面不显示补全
        show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", ",", ">" },
      },
      menu = {
        border = "rounded",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
    -- keymap = {
    --   preset = "enter",
    -- ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
    -- ["<Tab>"] = {
    --   function(cmp)
    --     if cmp.snippet_active() then
    --       return cmp.snippet_forward()
    --     end
    --   end,
    --   "select_next",
    --   "fallback",
    -- },
    -- ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    -- },
    sources = {
      -- 这里可以添加 nvim-cmp 的源
      -- compat = { "emoji" },
    },
  },
}
