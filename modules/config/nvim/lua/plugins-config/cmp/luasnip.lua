require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_vscode').lazy_load {
  paths = {
    vim.fn.stdpath('data') .. '~/.local/share/nvim/lazy/friendly-snippets',
    './snippets',
  },
}

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("markdown", {
    -- Slide header
    s("slide", {
        t({ "---", "title: " }),
        i(1, "Slide title"), -- タイトル
        t({ "", "layout: " }),
        c(2, { t("default"), t("cover"), t("center"), t("image") }), -- レイアウト
        t({ "", "theme: " }),
        i(3, "default"), -- テーマ
        t({ "", "---", "" }),
        i(0)
    }),

    -- New slide
    s("newslide", {
        t({ "---", "" }),
        i(0)
    }),

    -- Notes section
    s("note", {
        t({ "---note", "" }),
        i(1, "Write notes here"), -- ノート内容
        t({ "", "---", "" }),
        i(0)
    }),

    -- Code block
    s("code", {
        t({ "```" }),
        i(1, "language"), -- 言語指定
        t({ "", "" }),
        i(2, "Write code here"), -- コード内容
        t({ "", "```", "" }),
        i(0)
    }),

    -- Insert image
    s("image", {
        t("!["),
        i(1, "Alt text"), -- 代替テキスト
        t("]("),
        i(2, "Path to image"), -- 画像パス
        t(")"),
        i(0)
    }),

    -- List
    s("list", {
        t("- "),
        i(1, "List item"), -- 最初のリスト項目
        t({ "", "- " }),
        i(2, "Second list item"), -- 2番目のリスト項目
        i(0)
    }),

    -- Horizontal rule
    s("hr", {
        t({ "---", "" }),
        i(0)
    }),

    -- Table
    s("table", {
        t({ "| " }),
        i(1, "Header 1"),
        t(" | "),
        i(2, "Header 2"),
        t({ " |", "|---|---|", "| " }),
        i(3, "Data 1"),
        t(" | "),
        i(4, "Data 2"),
        t(" |"),
        i(0)
    }),

    -- Quote
    s("quote", {
        t({ "> " }),
        i(1, "Quoted text"), -- 引用内容
        t({ "", "" }),
        i(0)
    }),

    -- Math block
    s("math", {
        t("$$"),
        t({ "", "" }),
        i(1, "Write math formula here"), -- 数学内容
        t({ "", "$$", "" }),
        i(0)
    }),

    -- Block content
    s("block", {
        t({ "::: " }),
        i(1, "Block class"), -- ブロッククラス名
        t({ "", "" }),
        i(2, "Block content"), -- ブロック内の内容
        t({ "", "::: ", "" }),
        i(0)
    }),

    -- Transition effect
    s("transition", {
        t("transition: "),
        c(1, { t("fade"), t("slide"), t("zoom"), t("none") }), -- トランジションタイプ
        i(0)
    }),

    -- Background setting
    s("background", {
        t("background: "),
        i(1, "Image path or color code"), -- 背景値
        i(0)
    }),

    -- Slidev theme academic
    s("academic_cover", {
        t({ "", "coverAuthor: " }),
        i(1, "author"), -- 作者
        t({ "", "coverAuthorUrl: " }),
        i(2, "URL"), -- 作者のURL
        t({ "", "coverBackgroundUrl: " }),
        i(3, "URL"), -- 背景URL
        t({ "", "coverBackgroundSource: " }),
        i(4, "source"), -- 背景ソース
        t({ "", "coverBackgroundSourceUrl: " }),
        i(5, "URL"), -- 背景ソースのURL
        t({ "", "", "---", "" }),
        i(0)
    }),

    s("academic_table-of-contents", {
        t({ "", "layout: table-of-contents", ""}),
        i(0)
    }),

    s("academic_index", {
        t({ "---", "index:"}),
        t({""}),
        i(0)
    }),

    s("academic_academic_figure", {
        t({ "figure:", "" }),
        i(1, "Caption"), -- キャプション
        t({ "", "figureFootnoteNumber: " }),
        i(2, "Number"), -- フットノート番号
        t({ "", "figureUrl: " }),
        i(3, "URL"), -- 画像URL
        i(0),
        t({""}),
    }),

    s("academic_figure-side", {
        t({ "figure-side:", "" }),
        t({ "figureX: 'r'", "" }),
        i(1, "Caption"), -- キャプション
        t({ "", "figureFootnoteNumber: " }),
        i(2, "Number"), -- フットノート番号
        t({ "", "figureUrl: " }),
        i(3, "URL"), -- 画像URL
        i(0),
        t({""}),
    }),

    s("academic_footnotes", {
        t({ "---", "footnotes:" }),
        c(1, { t("true"), t("false") }), -- オーバーレイか否か
        t({ "", "separator: " }),
        c(2, { t("true"), t("false") }), -- 区切り線
        t({ "", "x: 'l'", "" }),
        i(0),
        t({""}),
    }),

    s("academic_footnote", {
        t({ "footnote:" }),
        i(1, "number"), -- フットノート番号
        i(0),
        t({""}),
    }),

    s("academic_pagination", {
        t({ "---", "pagination:" }),
        t({ "classNames: " }),
        i(1, "CSS class"),
        t({ "", "x: 'r'", "" }),
        c(2, { t("l"), t("r") }), -- 横位置
        t({ "y: 't'", "" }),
        c(3, { t("b"), t("t") }), -- 縦位置
        i(0),
        t({""}),
    })
})

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
