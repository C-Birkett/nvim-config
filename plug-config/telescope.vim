nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>fp <cmd>:lua require'telescope'.extensions.project.project{}<CR>

:lua << EOF

require'telescope'.load_extension('project')
require('telescope').load_extension('media_files')

require('telescope').setup{
  defaults = {
    generic_sorter = require'telescope.sorters'.get_fzy_sorter,
  }
}

EOF
