-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "c/c++ build",
  params = {
    args = { optional = false, type = "string", default = "" },
  },
  builder = function(params)
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local file_name = vim.fn.expand("%:t:r") .. ".out"
    local filetype = vim.bo.filetype
    local cmd_
    if filetype == "cpp" then
      cmd_ = "g++"
    else
      cmd_ = "gcc"
    end
    return {
      cmd = { cmd_ },
      args = { file, "-o", file_name, params.args },
      components = {
        "task_list_on_start",
        "on_exit_set_status",
        "on_complete_notify",
        "display_duration",
      },
    }
  end,
  condition = {
    filetype = { "cpp", "c" },
  },
}
