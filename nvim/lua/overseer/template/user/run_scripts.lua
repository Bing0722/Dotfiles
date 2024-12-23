return {
  name = "run script",
  params = {
    cmd = { optional = true, type = "string", default = "" },
    cwd = { optional = true, type = "string" },
    args = { optional = false, type = "string", default = "" },
  },
  builder = function(params)
    -- 获取当前文件的扩展名
    local filetype = vim.bo.filetype

    -- 根据文件扩展名选择合适的命令
    local cmd
    if filetype == "python" then
      cmd = params.cmd ~= "" and params.cmd or "python"
    elseif filetype == "lua" then
      cmd = params.cmd ~= "" and params.cmd or "lua"
    elseif filetype == "sh" then
      cmd = params.cmd ~= "" and params.cmd or "bash"
    else
      -- 默认执行命令（可以选择其他默认脚本命令）
      cmd = params.cmd ~= "" and params.cmd or "sh"
    end
    return {
      name = vim.fn.expand("%:t"),
      cmd = cmd,
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
    filetype = { "python", "lua", "sh" },
  },
}
