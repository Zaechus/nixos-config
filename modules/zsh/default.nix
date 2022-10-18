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

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  home.shellAliases = {
    diff = "diff --color";
    doas = "sudo";
    ip = "ip -c";
    l = "exa --icons --color=always";
    ll = "l -aalg";
    lisosort = "exa -lRs size --no-permissions --no-user --no-time ~/images/disk/**/*.iso";
    pp = "ping 1.1.1.1";
    watch = "watch -c -n 1 ";
  };
}
