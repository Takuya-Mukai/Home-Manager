-- GUIの色を有効にする (ターミナルで動作する際に必要)
vim.opt.termguicolors = true
-- 行番号を表示
vim.wo.number = true
-- 構文ハイライトを有効にする
vim.cmd("syntax enable")
vim.bo.autoindent = true
vim.bo.smartindent = true -- プログラミングをするなら便利- タブとインデントの設定
vim.bo.tabstop = 2         -- タブ文字の幅を2スペースに設定
vim.bo.shiftwidth = 2      -- 自動インデントの幅を2スペースに設定
vim.bo.expandtab = true    -- タブキーでスペースを挿入する
vim.bo.softtabstop = 2     -- Backspaceでタブストップ単位で削除する際に使用 (expandtabと組み合わせると便利)
vim.opt.updatetime = 300 -- 300ミリ秒に設定 (デフォルトは4000ミリ秒)
vim.opt.swapfile = false
vim.opt.whichwrap = "b,s,<,>,[,]"
-- ポップアップメニューの透明度
vim.opt.pumblend = 20
-- ウィンドウの透明度
vim.opt.winblend = 20
-- 現在のモード（INSERT, NORMALなど）を表示しない
vim.opt.showmode = false
-- 現在行にカーソルラインを表示しない
vim.wo.cursorline = false
-- 現在行からの相対行番号を表示
vim.wo.relativenumber = true
-- スクロールオフセット（カーソルが画面の端から何行離れたらスクロールするか）
vim.wo.scrolloff = 13
vim.wo.sidescrolloff = 12
-- 検索時に大文字小文字を区別しない
vim.o.ignorecase = true
-- 検索文字列に大文字が含まれる場合のみ大文字小文字を区別する
vim.o.smartcase = true
-- 括弧の対応をハイライト表示
vim.o.showmatch = true
-- 括弧の対応表示の持続時間（ミリ秒）
vim.o.matchtime = 1
-- ステータスラインの表示形式 (常に表示)
vim.opt.laststatus = 3
-- 隠し文字の表示レベル
vim.opt.conceallevel = 1
-- ヘルプファイルの言語設定
vim.o.helplang = "ja,en"
-- SignColumn（コード診断などの記号が表示される列）の表示設定
vim.api.nvim_set_option_value("signcolumn", "yes:1", { scope = "global" }) -- globalスコープを明示
-- クリップボードをシステムクリップボードと共有
vim.o.clipboard = "unnamedplus" -- vim.api.nvim_set_option_valueは重複しているため削除
-- 折り返しを無効にする
vim.api.nvim_set_option_value("wrap", false, {})
-- マップローカルリーダーキーを設定
vim.g.maplocalleader = ' '
-- Netrwを無効にする
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.hlsearch = true
-- 検索結果をハイライト表示
vim.opt.incsearch = true
-- 検索中にリアルタイムで結果を表示

vim.opt.list = true
vim.opt.listchars = "eol:¬,tab:> ,trail:·,nbsp:%" -- 見えるようにする文字を指定 (任意)

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.shortmess:append "I"

-- キーマッピング
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })

-- ターミナルが開かれたときに、行番号と相対行番号を非表示にする
vim.cmd("autocmd TermOpen * setlocal nonumber")
vim.cmd("autocmd TermOpen * setlocal norelativenumber")

local fcitx5state = vim.fn.system("fcitx5-remote"):sub(1, 1)

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    fcitx5state = vim.fn.system("fcitx5-remote"):sub(1, 1)
    vim.fn.system("fcitx5-remote -c")
  end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if fcitx5state == "2" then
      vim.fn.system("fcitx5-remote -o")
    end
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd [[%s/\s\+$//e]]
    end
})
