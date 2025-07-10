local trouble = require 'trouble'

trouble.setup {
  use_diagnostic_signs = true,
}


local wk=require("which-key")
wk.add({
  {'<leader>x', group ="trouble", icon=" ", color="red"},
  {'<leader>xx', function() trouble.open() end, desc="Show all"},
  {'<leader>xw', function() trouble.open 'workspace_diagnostics' end, desc="Workspace diagnostics", icon={" ", color="blue"} },
  {'<leader>xd', function() trouble.open 'document_diagnostics' end, desc="Document diagnostics", icon={"󰱼 ", color="blue"} },
  {'<leader>xq', function() trouble.open 'quickfix' end, desc="quickfix", icon={"󰁨 ", color="green"} },
  {'<leader>xl', function() trouble.open 'loclist' end, desc="Location list", icon={" ", color="cyan"} },
})

vim.keymap.set('n', 'gR', function() trouble.open 'lsp_references' end)
vim.keymap.set('n', 'gn', function() trouble.next { skip_groups = true, jump = true } end)
vim.keymap.set('n', 'gp', function() trouble.previous { skip_groups = true, jump = true } end)
vim.keymap.set('n', 'gF', function() trouble.first { skip_groups = true, jump = true } end)
vim.keymap.set('n', 'gL', function() trouble.last { skip_groups = true, jump = true } end)
