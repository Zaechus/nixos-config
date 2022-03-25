{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-gitgutter tokyonight-nvim lightline-vim vim-nix
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      filetype plugin on
      syntax enable

      set number
      set nowrap

      set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

      set noea

      colorscheme tokyonight
      set cursorline
      set colorcolumn=100

      let g:lightline = {'colorscheme': 'tokyonight'}

      let mapleader = " "

      " Enable/disable numbers+nowrap for copying
      map <leader>w :set nonumber<CR> :set wrap<CR>
      map <leader>n :set number<CR> :set nowrap<CR>

      " Split a terminal vertically or horizontally
      set splitright
      map <F5> :vsp +term<CR> <leader>w i
      set splitbelow
      map <F6> :sp +term<CR> :res 16<CR> <leader>w i

      " cargo fmt
      map <leader>f :wa<CR> :!cargo fmt<CR><CR> :windo e<CR>
      map <leader>c :wa<CR> :!cargo c<CR>
      map <leader>r :wa<CR> <F6>cargo r<CR>
      map <leader>t :wa<CR> :!cargo t<CR>

      " Open netrw in left-side window
      let g:netrw_list_hide = '^\.'
      map <F4> :set nosplitright<CR> :vsp .<CR> :vert res 24<CR> :set splitright<CR>

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

      " Alt+e to expand current window into a tab in any mode
      map <A-e> :tab split<CR>
      tnoremap <A-e> <C-\><C-N>:tab split<CR>
      inoremap <A-e> <C-\><C-N>:tab split<CR>
      nnoremap <A-e> :tab split<CR>
    '';
  };
}
