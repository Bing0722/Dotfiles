return {
  name = "run exe",
  params = {
    -- cmd = { optional = true, type = "string", default = "./" },
    args = { optional = false, type = "string", default = "" },
  },
  condition = {
    filetype = { "cpp", "c" },
  },
  builder = function(params)
    local file_name = vim.fn.expand("%:t:r") .. ".out"
    return {
      name = vim.fn.expand("%:t"),
      cmd = "./" .. file_name,
      args = { params.args },
      cwd = vim.fn.expand("%:p:h"),
      components = {
        "task_list_on_start",
        "on_exit_set_status",
        "on_complete_notify",
        "display_duration",
      },
    }
  end,
}
