return {
  "saghen/blink.cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = {
    completion = {
      trigger = {
        show_on_trigger_character = false,
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
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          local cmp_window = require("blink.cmp.completion.windows.menu").win
          if cmp_window and cmp_window:is_open() then
            return cmp.select_next()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          local cmp_window = require("blink.cmp.completion.windows.menu").win
          if cmp_window and cmp_window:is_open() then
            return cmp.select_prev()
          end
        end,
        "snippet_backward",
        "fallback",
      },
    },
    sources = {
      -- 这里可以添加 nvim-cmp 的源
      compat = { "emoji" },
    },
  },
}
