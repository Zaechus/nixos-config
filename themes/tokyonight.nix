# https://github.com/folke/tokyonight.nvim
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml

{ pkgs, ... }:

let tnBg = "#24283b";
    tnFg = "#c0caf5";
    tnBlue = "#4770c4";
    tnBlueFg = "#7aa2f7";
    tnBlack = "#1D202F";
    gray = "#5c5c5c";
in {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
    ];

    extraConfig = ''
      colorscheme tokyonight
      let g:lightline = {'colorscheme': 'tokyonight'}
    '';
  };
}
