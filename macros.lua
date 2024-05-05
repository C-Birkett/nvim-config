-- assorted macros, either my own or borrowed

-- date stamp
nnoremap <F4> "=strftime('%d/%m/%Y')<CR>P
inoremap <F4> <C-R>=strftime('%d/%m/%Y')<CR>

-- Compile and open/run

nnoremap <F6> :w % <Bar> ! ~/.config/nvim/plug-config/buildWikiPDF "%:p" <CR>

-- split resizing
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
