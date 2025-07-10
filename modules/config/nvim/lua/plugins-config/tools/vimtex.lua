vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
-- vim.g.vimtex_compiler_latexmk_engines = "-lualatex"
vim.g.vimtex_compiler_latexmk = {
  aux_dir = '',
  out_dir = '',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = {
    '-pdf',
    '-pdflatex=lualatex',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
