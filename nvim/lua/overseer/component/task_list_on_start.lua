local util = require("overseer.util")
local window = require("overseer.window")

return {
  desc = "在任务启动时打开任务列表", -- 描述组件功能
  -- 定义可以传递给组件的参数
  params = {
    -- 参见 :help overseer-params
  },
  -- 可选，默认为 true。设置为 false 则不允许在任务编辑器中编辑此组件
  editable = true,
  -- 可选，默认为 true。设置为 false 则在保存任务到磁盘时不序列化此组件
  serializable = true,
  -- 传入的参数将匹配上面定义的参数
  constructor = function(params)
    -- 可选地定义以下方法
    return {
      -- 初始化任务时调用
      -- 这里是初始化资源的好地方（如果需要）
      on_init = function(self, task)
        -- 当任务创建时调用
      end,

      ---@return nil|boolean
      -- 在任务启动之前调用
      -- 返回 false 可以防止任务启动
      on_pre_start = function(self, task) end,

      -- 任务启动时调用
      on_start = function(self, task)
        -- 如果当前在任务列表中，则在最近的其他窗口中打开一个分屏
        window.open({ direction = "right" })
      end,

      -- 任务重置时调用
      on_reset = function(self, task)
        -- 任务被重置以重新运行时调用
      end,

      ---@return table
      -- 任务最终结果之前调用
      -- 返回一个类似 map 的表格，将其合并到任务结果中
      on_pre_result = function(self, task)
        return { foo = { "bar", "baz" } } -- 示例返回
      end,

      ---@param result table 结果表
      -- 在任务结果之前调用，用于处理和更新结果
      on_preprocess_result = function(self, task, result) end,

      ---@param result table 结果表
      -- 任务有结果时调用，通常是命令完成后，某些类型的任务可能在运行时就设置结果
      on_result = function(self, task, result) end,

      ---@param status overseer.Status 任务状态（CANCELED, FAILURE, SUCCESS）
      ---@param result table 结果表
      -- 任务完成时调用
      on_complete = function(self, task, status, result) end,

      ---@param status overseer.Status 任务状态
      -- 任务状态发生变化时调用
      on_status = function(self, task, status) end,

      ---@param data string[] 任务输出的内容，参见 :help channel-lines
      -- 任务输出时调用
      on_output = function(self, task, data) end,

      ---@param lines string[] 完成的输出行，已移除 ansi 代码
      -- 任务输出行时调用，通常比直接使用 on_output 更容易处理
      on_output_lines = function(self, task, lines) end,

      ---@param code number 进程退出代码
      -- 任务命令完成时调用
      on_exit = function(self, task, code) end,

      -- 任务被销毁时调用
      -- 在调用 on_init 后，且只会调用一次，适合释放资源（如定时器、文件等）
      on_dispose = function(self, task) end,

      ---@param lines string[] 渲染的行列表
      ---@param highlights table[] 高亮列表，渲染后应用
      ---@param detail number 任务的详细级别，范围从 1 到 3
      -- 从任务列表中调用，可以用来显示任务信息
      render = function(self, task, lines, highlights, detail)
        -- 示例：table.insert(lines, "这里是输出的一行")
        -- 高亮格式：{highlight_group, lnum, col_start, col_end}
        -- table.insert(highlights, {'Title', #lines, 0, -1})
      end,
    }
  end,
}
