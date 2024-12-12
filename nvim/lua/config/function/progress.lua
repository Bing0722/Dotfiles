-- 📢通知进度条
local notify = require("notify")

-- 保存通知的 ID
local notification_id = nil
local progress = 0
local is_completed = false -- 添加一个标志，防止进度超过 100%

-- 进度条的总长度
local progress_bar_length = 20

-- 创建进度条字符串
local function create_progress_bar(progress)
  local completed_length = math.floor(progress / 100 * progress_bar_length)
  local remaining_length = progress_bar_length - completed_length
  return string.rep("#", completed_length) .. string.rep(".", remaining_length)
end

-- 更新进度的函数
local function update_progress()
  vim.schedule(function()
    if is_completed then
      return -- 如果任务已经完成，则不再更新进度
    end

    local progress_bar = create_progress_bar(progress) -- 创建进度条
    local message = string.format("LSP任务进度: [%s] %d%%", progress_bar, progress) -- 生成通知文本

    if notification_id then
      -- 如果通知 ID 存在，替换原有通知
      print("Replacing notification with ID: " .. tostring(notification_id)) -- 打印 ID 调试
      notification_id = notify(message, "info", {
        replace = notification_id, -- 替换之前的通知
        timeout = false, -- 通知不自动消失
        title = "进度条",
      }).id -- 获取新的通知 ID
    else
      -- 如果没有找到通知 ID，创建新的通知
      print("Creating new notification.") -- 打印调试信息
      notification_id = notify(message, "info", {
        timeout = false, -- 通知不自动消失
      }).id -- 获取新的通知 ID
    end

    -- 模拟进度增加
    progress = progress + 10
    if progress >= 100 then
      -- 当进度达到 100% 时，显示任务完成的通知
      print("Progress reached 100%, displaying completion message.")
      local completion_message = string.format("LSP任务完成 [%s]", create_progress_bar(100)) -- 完成时的进度条
      notification_id = notify(completion_message, "info", {
        replace = notification_id, -- 替换之前的进度通知
        timeout = 2000, -- 通知显示 2 秒后消失
      }).id -- 获取新的通知 ID
      is_completed = true -- 设置为已完成，避免后续继续更新
      notification_id = nil -- 清空 ID，表示任务已完成
    end
  end)
end

-- 模拟定时更新进度条
vim.defer_fn(function()
  update_progress() -- 初次更新
  -- 设置定时器，每 500 毫秒更新一次进度
  for i = 1, 10 do
    vim.defer_fn(function()
      update_progress()
    end, i * 500)
  end
end, 1000) -- 初次延迟 1 秒开始
