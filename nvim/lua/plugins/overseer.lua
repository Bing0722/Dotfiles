return {
  {
    "stevearc/overseer.nvim",
    opts = {
      templates = { "builtin", "make", "user.cpp_build", "user.run_scripts", "user.run_exe" }, -- 定义模板
      strategy = {
        "toggleterm", -- 使用 toggleterm 作为任务运行的策略
        -- 在任务启动之前是否加载默认 shell
        use_shell = false, -- 不使用默认 shell
        -- 覆盖 toggleterm 的默认 "direction" 参数（窗口方向）
        direction = "float", -- 指定为浮动窗口
        -- 覆盖 toggleterm 的默认 "highlights" 参数（高亮配置）
        highlights = nil, -- 不指定，保持默认值
        -- 覆盖 toggleterm 的默认 "auto_scroll" 参数（自动滚动）
        auto_scroll = false, -- 禁止
        -- 在任务退出后，是否自动关闭并删除终端缓冲区
        close_on_exit = false, -- 不关闭窗口或删除缓冲区
        -- 在任务退出后，是否关闭窗口（不删除缓冲区）
        -- 可选值："never"（从不关闭）、"success"（仅任务成功时关闭）或 "always"（始终关闭）
        quit_on_exit = "never", -- 从不关闭窗口
        -- 当任务启动时，是否自动打开 toggleterm 窗口
        open_on_start = true, -- 启动任务时自动打开窗口
        -- 是否隐藏任务窗口，防止其在 toggleable 窗口中显示
        hidden = false, -- 不隐藏窗口
        -- 当终端创建时运行的命令
        -- 如果结合 `use_shell` 设置，可以在任务启动前运行某些命令
        on_create = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      },
      task_list = {
        direction = "left",
        max_width = { 30, 0.2 },
        min_width = { 20, 0.1 },
      },
      task_editor = {
        bindings = {
          i = {
            ["<CR>"] = "Submit",
          },
          n = {
            ["<CR>"] = "Submit",
          },
        },
      },
    },
  },
}
