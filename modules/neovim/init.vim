filetype plugin on
syntax enable

if has('termguicolors')
  set termguicolors
endif

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.closable = v:false
let bufferline.icons = v:false

set number
set nowrap

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set noea

set cursorline
"set colorcolumn=100

let mapleader = " "

" Enable/disable numbers+nowrap for copying
map <leader>w :set nonumber<CR> :set wrap<CR>
map <leader>n :set number<CR> :set nowrap<CR>

" Split a terminal vertically or horizontally
set splitright
map <F5> :vsp +term<CR> <leader>w i
set splitbelow
map <F6> :sp +term<CR> :res 13<CR> <leader>w i

" cargo
map <leader>f :wa<CR> :!cargo fmt<CR><CR> :windo e<CR>
map <leader>c :wa<CR> :!cargo c<CR>
map <leader>r :wa<CR> <F6>cargo r<CR>
map <leader>t :wa<CR> :!cargo t<CR>

" tree
let g:netrw_list_hide = '^\.'
"map <F4> :set nosplitright<CR> :vsp .<CR> :vert res 22<CR> :set splitright<CR>
nnoremap <F4> :NvimTreeToggle<CR>

" Alt+<arrow> to switch windows in any mode
map <A-Left> <C-w>h
map <A-Down> <C-w>j
map <A-Up> <C-w>k
map <A-Right> <C-w>l
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Alt+e to expand current window into a tab in any mode
map <A-e> :tab split<CR>
tnoremap <A-e> <C-\><C-N>:tab split<CR>
inoremap <A-e> <C-\><C-N>:tab split<CR>
nnoremap <A-e> :tab split<CR>
