map <silent> <leader>d :CocDiagnostics<CR>
map <silent> <leader>o :CocOutline<CR>

" cargo
map <silent> <leader>f :wa<CR> :!cargo fmt<CR><CR> :windo e<CR>
map <silent> <leader>c :wa<CR> :!cargo c<CR>
map <silent> <leader>t :wa<CR> :!cargo t<CR>
map <silent> <leader>r :wa<CR> :TermExec cmd="cargo r" go_back=0<CR>
