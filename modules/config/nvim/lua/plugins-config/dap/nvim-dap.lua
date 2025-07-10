vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))', {})
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))', {})
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()', {})
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()', {})
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dap").continue()', {})
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})

local dap =require('dap')
dap.adapters = {
  codelldb = {
    type = 'server',
    port = '${port}',
    executable = {

      -- Masonはここにデバッガを入れてくれる
      command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',

      -- ポートを自動的に割り振ってくれる
      args = {'--port', '${port}'}
    }
  }
}
dap.configurations = {
  c = {
    -- 複数指定することもできる
    -- 複数あるとデバッグ開始時にどの設定使うか聞かれる
    {
      -- なくてもいい。複数の設定があるとき、それらを識別するための名前
      -- name = 'Launch file',

      -- dap.adapters にあるデバッガから、どれを使うか
      type = 'codelldb',

      -- デバッガ起動する
      request = 'launch',

      -- コンパイル時に -g オプションをつけてビルドした実行ファイルを指定する
      -- こんな感じでinputで指定できるようにしておく
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/a.out', 'file')
      end,

      -- よく分からないけど、nvim-dapのWikiに書いてあったので
      cwd = '${workspaceFolder}',

      -- trueだとバイナリのデバッグになっちゃう(なんで?)
      stopOnEntry = false
    }
  },
}
dap.configurations.cpp = dap.configurations.c
