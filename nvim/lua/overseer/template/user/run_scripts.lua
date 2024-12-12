return {
  name = "run python script",
  params = {
    cmd = { optional = true, type = "string", default = "python3" },
    cwd = { optional = true, type = "string" },
  },
  builder = function(params)
    return {
      name = vim.fn.expand("%:t"),
      cmd = params.cmd,
      args = { vim.fn.expand("%:p") },
      cwd = vim.fn.expand("%:p:h"),
      components = {
        components = {
          { "on_output_quickfix", open = not params.bang, open_height = 8 },
          "default",
          "on_exit_set_status",
          "on_result_diagnostics",
        },
        on_exit = function(exit_code)
          if exit_code == 0 then
            -- 任务成功时的行为
            vim.notify("Task completed successfully")
          else
            -- 任务失败时的行为
            vim.notify("Task failed with exit code " .. exit_code)
          end
        end,
      },
    }
  end,
  condition = {
    filetype = { "python" },
  },
}
