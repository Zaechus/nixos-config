filetype plugin on
syntax enable

if has('termguicolors')
  set termguicolors
endif

set number
set nowrap

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set noea

set cursorline
"set colorcolumn=100

let mapleader = " "

" Enable/disable numbers+nowrap for copying
map <leader>w :set nonumber<CR> :set wrap<CR> :set nocursorline<CR> :GitGutterDisable<CR>
map <leader>n :set number<CR> :set nowrap<CR> :set cursorline<CR> :GitGutterEnable<CR>

" Split a terminal vertically or horizontally
set splitright
map <F5> :vsp +term<CR> <leader>w i
set splitbelow
map <F6> :sp +term<CR> :res 13<CR> <leader>w i
map <F7> :tabnew +term<CR> <leader>w i

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
noremap <A-Left> <C-w>h
noremap <A-Down> <C-w>j
noremap <A-Up> <C-w>k
noremap <A-Right> <C-w>l
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l

" Alt+e to expand current window into a tab in any mode
noremap <A-e> :tab split<CR>
tnoremap <A-e> <C-\><C-N>:tab split<CR>
inoremap <A-e> <C-\><C-N>:tab split<CR>

" Switch tabs
nnoremap <silent><A-0>           :tablast<CR>
tnoremap <silent><A-0> <C-\><C-N>:tablast<CR>
inoremap <silent><A-0> <C-\><C-N>:tablast<CR>

nnoremap <A-,>           gT
nnoremap <A-.>           gt
inoremap <A-,> <C-\><C-N>gT
inoremap <A-.> <C-\><C-N>gt
tnoremap <A-,> <C-\><C-N>gT
tnoremap <A-.> <C-\><C-N>gt

nnoremap <A-1>           1gt
nnoremap <A-2>           2gt
nnoremap <A-3>           3gt
nnoremap <A-4>           4gt
nnoremap <A-5>           5gt
nnoremap <A-6>           6gt
nnoremap <A-7>           7gt
nnoremap <A-8>           8gt
nnoremap <A-9>           9gt
tnoremap <A-1> <C-\><C-N>1gt
tnoremap <A-2> <C-\><C-N>2gt
tnoremap <A-3> <C-\><C-N>3gt
tnoremap <A-4> <C-\><C-N>4gt
tnoremap <A-5> <C-\><C-N>5gt
tnoremap <A-6> <C-\><C-N>6gt
tnoremap <A-7> <C-\><C-N>7gt
tnoremap <A-8> <C-\><C-N>8gt
tnoremap <A-9> <C-\><C-N>9gt
inoremap <A-1> <C-\><C-N>1gt
inoremap <A-2> <C-\><C-N>2gt
inoremap <A-3> <C-\><C-N>3gt
inoremap <A-4> <C-\><C-N>4gt
inoremap <A-5> <C-\><C-N>5gt
inoremap <A-6> <C-\><C-N>6gt
inoremap <A-7> <C-\><C-N>7gt
inoremap <A-8> <C-\><C-N>8gt
inoremap <A-9> <C-\><C-N>9gt
