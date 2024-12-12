---@diagnostic disable: undefined-doc-name, param-type-mismatch
local M = {}

--- 输入参数
---@param func function @ 输入参数之后的回调
---@param filetype string @文件类型
function M.args(func, filetype)
  -- 根据文件类型决定编译命令
  local opts
  if filetype == "cpp" then
    opts = {
      prompt = "请输入你需要的参数: ",
      default = "-std=c++17 -g ",
      multiline = false,
    }
  elseif filetype == "c" then
    opts = {
      prompt = "请输入你需要的参数: ",
      default = "-g ",
      multiline = false,
    }
  else
    opts = {
      prompt = "请输入运行时所需要的参数: ",
      default = "",
      multiline = false,
    }
  end
  Snacks.input.input(opts, func)
end

--- 🔗链接参数
---@param func function @ 输入链接参数后的回调
function M.link(func)
  local opts = {
    prompt = "请输入你需要链接的库: ",
    default = "",
    multiline = false,
  }
  Snacks.input.input(opts, func)
end

--- 编译
---@param filetype string @ 编译的文件类型
function M.compile(filetype)
  -- 获取当前文件的完整路径和输出文件的路径
  local filename = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".out"
  local cmd
  local is_link

  -- 根据文件类型决定编译命令
  if filetype == "cpp" then
    cmd = "g++ "
  elseif filetype == "c" then
    cmd = "gcc "
  else
    vim.notify("不支持该文件类型的编译。", "error", { title = "Compile Program" })
    return
  end
  local function func1(args)
    local function func2(link)
      if link == "" then
        is_link = "无需进行链接.\n"
        cmd = cmd .. string.format("%s %s -o %s", args, filename, output)
      elseif not link then
        vim.notify("编译已取消.", "warn", { title = "Compile Program" })
        return
      else
        is_link = "链接到 -> " .. link .. "\n"
        cmd = cmd .. string.format("%s %s -o %s %s", args, filename, output, link)
      end

      local output_message = "" -- 用于存储标准输出
      local error_message = "" -- 用于存储标准错误
      local program_success = false

      -- 异步执行编译命令
      vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
          vim.notify(is_link .. "正在编译...\n" .. cmd, "info", { title = "Compile Program" })
          if data then
            output_message = output_message .. table.concat(data, "\n") .. "\n"
          end
        end,
        on_stderr = function(_, data)
          if data then
            error_message = error_message .. table.concat(data, "\n") .. "\n"
          end
        end,
        on_exit = function(_, code)
          if code == 0 then
            program_success = true
          end

          -- 根据是否有输出内容决定是否发送通知
          if program_success then
            if output_message ~= "" then
              vim.notify(
                "编译成功!\n输出到:" .. output .. "\n" .. output_message,
                "info",
                { title = "Compile Program" }
              )
            else
              vim.notify("编译成功:\n" .. output_message, "info", { title = "Compile Program" })
            end
          else
            -- 如果有错误消息，显示错误消息
            if error_message ~= "" then
              vim.notify("编译错误: " .. error_message, "error", { title = "Compile Program" })
            else
              -- 如果没有错误输出，且程序执行失败，显示退出码
              vim.notify("编译失败! 错误码: " .. code, "error", { title = "Compile Program" })
            end
          end
        end,
      })
    end
    M.link(func2)
  end
  M.args(func1, filetype)
end

--- 运行简单脚本或程序 通过notify输出
---@param filetype string @文件类型
function M.run(filetype)
  local notify = vim.notify
  -- 获取编译后的输出文件（假设是 a.out 或自定义的输出文件名）
  local output_file = vim.fn.expand("%:p:r") .. ".out"
  local cmd
  if filetype == "cpp" or filetype == "c" then
    if vim.fn.filereadable(output_file) == 0 then
      notify("未找到可执行文件! 请先编译代码.", "error", { title = "Run Program" })
      return
    end
    cmd = output_file
  elseif filetype == "lua" then
    cmd = "lua " .. vim.fn.expand("%:p")
  elseif filetype == "python" then
    cmd = "python3 " .. vim.fn.expand("%:p")
  else
    notify("不支持的可执行文件类型.", "error", { title = "Run Program" })
    return
  end

  local function func(args)
    cmd = cmd .. " " .. args
    local output_message = "" -- 用于存储标准输出
    local error_message = "" -- 用于存储标准错误
    local program_success = false

    -- 异步运行程序并捕获输出
    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data then
          output_message = output_message .. table.concat(data, "\n") .. "\n"
        end
      end,
      on_stderr = function(_, data)
        if data then
          error_message = error_message .. table.concat(data, "\n") .. "\n"
        end
      end,
      on_exit = function(_, code)
        if code == 0 then
          program_success = true
        end

        -- 根据是否有输出内容决定是否发送通知
        if program_success then
          if output_message ~= "" then
            notify(output_message, "info", { title = "程序输出", timeout = 5000 })
          else
            -- 如果没有输出，但程序执行成功，则显示成功消息
            notify("程序成功执行! 没有输出.", "info", { title = "Run Program" })
          end
        else
          -- 如果有错误消息，显示错误消息
          if error_message ~= "" then
            notify("程序错误:\n" .. error_message, "error", { title = "Run Program" })
          else
            -- 如果没有错误输出，且程序执行失败，显示退出码
            notify("程序执行失败! 错误码:" .. code, "error", { title = "Run Program" })
          end
        end
      end,
    })
  end
  M.args(func, "")
end

return M
