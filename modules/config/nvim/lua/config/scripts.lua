if vim.fn.getenv("INSERT_CREATED_HEADER") == "1" then
  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.md",
    callback = function()
      vim.bo.modifiable = true
      local datetime = os.date("%Y-%m-%d %H:%M")
      local header = string.format("---\ncreated: %s\ntags: []\n---\n", datetime)
      if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
        vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
        vim.cmd("startinsert")
      end
    end,
  })
end

-- 保存時にタイトルを使ってファイル名を変える
local function auto_rename_on_save()
  if vim.bo.filetype ~= "markdown" then return end

  local old_path = vim.api.nvim_buf_get_name(0)
  if old_path == "" or vim.fn.filereadable(old_path) == 0 then return end

  -- 先頭数行からタイトルを探す
  local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
  local title
  for _, line in ipairs(lines) do
    title = line:match("^##%s*(.+)")
    if title then break end
  end

  if not title then return end

  -- 不正文字の除去
  title = title:gsub("[/:\\?%%*|\"<>]", ""):gsub("%s+", "_")

  -- 新しいファイル名の作成
  local dir = vim.fn.fnamemodify(old_path, ":h")
  local new_name = os.date("%Y-%m-%d_%H%M_") .. title .. ".md"
  local new_path = dir .. "/" .. new_name

  -- 同名なら何もしない
  if old_path == new_path then return end

  -- ファイルが存在する場合は上書きしない
  if vim.loop.fs_stat(new_path) then
    vim.notify("保存先に同名ファイルが存在します: " .. new_path, vim.log.levels.WARN)
    return
  end

  -- 保存して現在のバッファを置き換える
  vim.cmd("silent! write")
  vim.cmd("saveas! " .. vim.fn.fnameescape(new_path))
  vim.cmd("silent! bwipeout " .. vim.fn.fnameescape(old_path))
end

-- 自動実行設定：Markdown の保存前
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = auto_rename_on_save,
})
