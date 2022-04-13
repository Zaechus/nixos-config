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

set mouse=a

set clipboard=unnamedplus

let mapleader = ' '

" Save and quit session
noremap <silent> <C-X> :wa<CR> :mksession!<CR> :qa<CR>

" Split a terminal vertically or horizontally
set splitright
set splitbelow
map <silent> <F4> :sp +term<CR> :res 13<CR> <leader>w i
map <silent> <F5> :vsp +term<CR> <leader>w i
map <silent> <F6> :tabnew +term<CR> <leader>w i

" toggleterm
noremap  <silent> <C-_>           :ToggleTerm<CR>
tnoremap <silent> <C-_> <C-\><C-N>:ToggleTerm<CR>
inoremap <silent> <C-_> <C-\><C-N>:ToggleTerm<CR>

" tree
nnoremap <silent> <F3> :NvimTreeToggle<CR>

" Alt+<arrow> to switch windows in any mode
noremap  <A-Left>  <C-w>h
noremap  <A-Down>  <C-w>j
noremap  <A-Up>    <C-w>k
noremap  <A-Right> <C-w>l
tnoremap <A-Left>  <C-\><C-N><C-w>h
tnoremap <A-Down>  <C-\><C-N><C-w>j
tnoremap <A-Up>    <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left>  <C-\><C-N><C-w>h
inoremap <A-Down>  <C-\><C-N><C-w>j
inoremap <A-Up>    <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l

" Alt+e to expand current window into a tab in any mode
noremap  <silent> <A-e> :tab split<CR>
tnoremap <silent> <A-e> <C-\><C-N>:tab split<CR>
inoremap <silent> <A-e> <C-\><C-N>:tab split<CR>

" Switch tabs
noremap  <silent> <A-0>           :tablast<CR>
tnoremap <silent> <A-0> <C-\><C-N>:tablast<CR>
inoremap <silent> <A-0> <C-\><C-N>:tablast<CR>

noremap  <A-,>           gT
noremap  <A-.>           gt
inoremap <A-,> <C-\><C-N>gT
inoremap <A-.> <C-\><C-N>gt
tnoremap <A-,> <C-\><C-N>gT
tnoremap <A-.> <C-\><C-N>gt

noremap  <A-1>           1gt
noremap  <A-2>           2gt
noremap  <A-3>           3gt
noremap  <A-4>           4gt
noremap  <A-5>           5gt
noremap  <A-6>           6gt
noremap  <A-7>           7gt
noremap  <A-8>           8gt
noremap  <A-9>           9gt
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

" bufferline
nnoremap <silent> <leader>a :BufferLineSortByTabs<CR>

nnoremap <silent> <leader>, :BufferLineCyclePrev<CR>
nnoremap <silent> <leader>. :BufferLineCycleNext<CR>

nnoremap <silent> <leader>< :BufferLineMovePrev<CR>
nnoremap <silent> <leader>> :BufferLineMoveNext<CR>

nnoremap <silent> <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent> <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent> <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent> <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent> <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent> <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent> <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent> <leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent> <leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
