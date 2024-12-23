return {
  name = "run python script",
  params = {
    cmd = { optional = true, type = "string", default = "python3" },
    cwd = { optional = true, type = "string" },
    args = { optional = false, type = "string", default = "" },
  },
  builder = function(params)
    return {
      name = vim.fn.expand("%:t"),
      cmd = params.cmd,
      args = { vim.fn.expand("%:p") },
      cwd = vim.fn.expand("%:p:h"),
      components = {
        "task_list_on_start",
        "on_exit_set_status",
        "on_complete_notify",
        "display_duration",
      },
    }
  end,
  condition = {
    filetype = { "python" },
  },
}
