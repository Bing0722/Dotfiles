return {
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
