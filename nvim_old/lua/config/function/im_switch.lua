-- 输入法切换

local input_toggle = 0

local switch = {
  en = "fcitx5-remote -c",
  zh = "fcitx5-remote -o",
  check = "fcitx5-remote",
}

local function change_to_en()
  local input_status = tonumber(io.popen(switch.check):read("*all"))
  if input_status == 2 then
    input_toggle = 1
    vim.fn.system(switch.en)
  end
end

local function change_to_zh()
  local input_status = tonumber(io.popen(switch.check):read("*all"))
  if input_status ~= 2 and input_toggle == 1 then
    vim.fn.system(switch.zh)
    input_toggle = 0
  end
end

local function is_not_in_code_block() --markdown
  local node_cursor = vim.treesitter.get_captures_at_cursor(0)
  for _, v in pairs(node_cursor) do
    if string.find(v, "markup.link") or string.find(v, "markup.raw") then
      return false
    end
  end
  return true
end

local function filetype_checke()
  if vim.bo.filetype == "markdown" then
    return is_not_in_code_block()
  else
    return true
  end
end

return {
  change_to_en = change_to_en,
  change_to_zh = change_to_zh,
  filetype_checke = filetype_checke,
}
