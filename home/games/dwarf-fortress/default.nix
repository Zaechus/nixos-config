{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (dwarf-fortress.override {
      enableIntro = false;
      enableTextMode = true;
      enableSound = false;
    })
  ];

  programs.nushell.extraConfig = ''
    def --wrapped dwarf-fortress [...args: string] {
      alacritty msg config 'font.normal.family = "DejaVu Sans Mono"'
      alacritty msg config draw_bold_text_with_bright_colors=true
      ^dwarf-fortress
      alacritty msg config draw_bold_text_with_bright_colors=false
      alacritty msg config 'font.normal.family = "monospace"'
    }
  '';
}
