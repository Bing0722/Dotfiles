return {
  "mikavilpas/yazi.nvim", -- 插件的名称和作者
  event = "VeryLazy", -- 插件的加载时机，表示在非常懒加载时加载插件
  keys = {
    -- 👇 在此部分，选择你自己的快捷键映射！
    {
      "<F7>", -- 设置快捷键
      "<cmd>Yazi<cr>", -- 执行 Yazi 命令
      desc = "在当前文件中打开 yazi", -- 快捷键的描述
    },
    {
      -- 在当前工作目录中打开文件管理器
      "<F8>", -- 设置快捷键
      "<cmd>Yazi cwd<cr>", -- 执行 Yazi cwd 命令
      desc = "在 nvim 的工作目录中打开文件管理器", -- 快捷键的描述
    },
    -- {
    --   -- 注意：此功能需要使用带有以下更改的版本
    --   -- https://github.com/sxyazi/yazi/pull/1305，版本更新于 2024-07-18
    --   "<c-up>", -- 设置快捷键
    --   "<cmd>Yazi toggle<cr>", -- 切换最后一个 Yazi 会话
    --   desc = "恢复上一个 yazi 会话", -- 快捷键的描述
    -- },
  },
  opts = {
    -- 如果你希望在打开目录时使用 yazi 而不是 netrw，下面会提供更多信息
    open_for_directories = false, -- 设置为 false 表示不在打开目录时自动启动 Yazi
    keymaps = {
      show_help = "<f1>", -- 设置显示帮助的快捷键
    },
  },
}
