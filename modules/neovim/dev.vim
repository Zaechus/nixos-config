map <silent> <leader>d :CocDiagnostics<CR>
map <silent> <leader>o :CocOutline<CR>

" cargo
map <silent> <leader>rf :wa<CR> :!cargo fmt<CR><CR> :windo e<CR>
map <silent> <leader>rc :wa<CR> :!cargo c<CR>
map <silent> <leader>rt :wa<CR> :!cargo t<CR>
map <silent> <leader>rr :wa<CR> :TermExec cmd="cargo r" go_back=0<CR>
