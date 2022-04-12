map <silent> <leader>d :CocDiagnostics<CR>

" toggleterm
noremap  <silent> <C-_>           :ToggleTerm<CR>
tnoremap <silent> <C-_> <C-\><C-N>:ToggleTerm<CR>
inoremap <silent> <C-_> <C-\><C-N>:ToggleTerm<CR>

" cargo
map <silent> <leader>f :wa<CR> :!cargo fmt<CR><CR> :windo e<CR>
map <silent> <leader>c :wa<CR> :!cargo c<CR>
map <silent> <leader>t :wa<CR> :!cargo t<CR>
map <silent> <leader>r :wa<CR> :TermExec cmd="cargo r"<CR>
