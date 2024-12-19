return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "Normal",
        max_height = 30,
        max_width = 60,
        on_close = function() end,
        on_open = function() end,
        fps = 30,
        icons = {
          ERROR = "", -- 使用 Font Awesome 的错误图标
          WARN = "", -- 使用警告图标
          INFO = "", -- 使用信息图标
          DEBUG = "", -- 使用调试图标
          TRACE = "✎", -- 使用追踪图标
        },
        level = 2,
        minimum_width = 50,
        render = "default", -- "default"、"minimal"、"simple"、"compact"、"wrapped-compact"
        stages = "fade", -- "fade_in_slide_out"、"fade"、"slide"、"static"
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T",
        },
        timeout = 2000,
        top_down = true,
      })
    end,
  },
}
