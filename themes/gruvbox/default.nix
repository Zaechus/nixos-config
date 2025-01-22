# https://github.com/morhetz/gruvbox
# https://github.com/gruvbox-community/gruvbox
# https://raw.githubusercontent.com/wiki/gruvbox-community/gruvbox/images/gruvbox_palette_dark.png
# https://github.com/alacritty/alacritty-theme/blob/master/themes/gruvbox_dark.toml

{
  programs.git.config.delta.syntax-theme = "gruvbox-dark";

  # https://chrome.google.com/webstore/detail/czo-gruvbox64-theme/hmalklkailocblgkjpdagjoieifkdfbj
  programs.chromium.extensions = [ "hmalklkailocblgkjpdagjoieifkdfbj" ];
}
