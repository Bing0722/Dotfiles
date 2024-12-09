return {
  {
    -- 增强颜色代码的颜色显示 #ff00ff
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    -- 增强笔记文件显示，markdown, orgmode, neorg
    -- show latex on markdown file can use plugin "jbyuki/nabla.nvim"
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("headlines").setup()
    end,
  },
  {
    -- 插件名称：accelerated-jk
    -- 功能：加速上下移动光标，提高导航效率
    "rhysd/accelerated-jk",
    enabled = false,
    config = function()
      -- 使用 vim.keymap.set 将快捷键映射到 accelerated-jk 的功能
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "快速向下移动" })
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "快速向上移动" })
    end,
  },
  {
    -- 支持快速片段化运行代码
    "michaelb/sniprun",
    build = "bash ./install.sh",
    config = function()
      require("sniprun").setup({
        display = {
          -- "Classic", --# display results in the command-line  area
          "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
          -- "VirtualTextErr", --# display error results as virtual text
          -- "TempFloatingWindow", --# display results in a floating window
          -- "LongTempFloatingWindow", --# same as above, but only long results. To use with VirtualText__
          -- "Terminal", --# display results in a vertical split
          -- "TerminalWithCode", --# display results and code history in a vertical split
          -- "NvimNotify",              --# display with the nvim-notify plugin
          -- "Api", --# return output to a programming interface
        },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim", -- 插件名
    cmd = { "ToggleTerm", "TermExec" }, -- 触发插件的命令，当输入这些命令时会启动终端窗口
    opts = {
      highlights = {
        Normal = { link = "Normal" }, -- 设置 Normal 高亮样式
        NormalNC = { link = "NormalNC" }, -- 设置 NormalNC 高亮样式
        NormalFloat = { link = "NormalFloat" }, -- 设置浮动窗口的 Normal 高亮样式
        FloatBorder = { link = "FloatBorder" }, -- 设置浮动窗口的边框样式
        StatusLine = { link = "StatusLine" }, -- 设置状态栏的样式
        StatusLineNC = { link = "StatusLineNC" }, -- 设置非活动窗口的状态栏样式
        WinBar = { link = "WinBar" }, -- 设置窗口条的样式
        WinBarNC = { link = "WinBarNC" }, -- 设置非活动窗口的窗口条样式
      },
      size = 10, -- 设置终端窗口的大小，这里是 10，表示窗口高度
      on_create = function()
        vim.opt.foldcolumn = "0" -- 禁用折叠栏
        vim.opt.signcolumn = "no" -- 禁用标志列
      end,
      start_in_insert = true, -- 启动时进入插入模式
      autochdir = true, -- 自动切换当前目录为终端的所在目录
      shading_factor = 1, -- 设置浮动终端的阴影效果，数值越大阴影越深
      direction = "float", -- 设置终端窗口的方向为浮动窗口
      float_opts = { border = "rounded" }, -- 设置浮动窗口的边框样式为圆角
    },
  },
}
