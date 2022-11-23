{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";

    initExtra = ''
      path=("$HOME/.cargo/bin" $path)
      path+=("$HOME/.local/bin")

      lt() {
          exa --icons --color=always --git-ignore -TL $1 $2 | bat -p
      }
      lta() {
          exa --icons --color=always -aT $1 | bat -p
      }

      PROMPT=$'\n'"%F{6}%~%f"$'\n'"%B%(#.%F{1}.%F{2})%# %f%b"
    '';
  };

  programs.zoxide.enableZshIntegration = true;

  home.shellAliases = {
    l = "exa --icons --color=always";
    ll = "l -aalg";
  };
}
