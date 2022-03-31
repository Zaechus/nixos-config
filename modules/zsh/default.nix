{
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat";
  };

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

    shellAliases = {
      btm = "btm -R";
      diff = "diff --color";
      doas = "sudo";
      l = "exa --icons --color=always";
      ll = "l -aalg";
      lisosort = "exa -lRs size --no-permissions --no-user --no-time ~/images/disk/**/*.iso";
      pp = "ping 1.1.1.1";
      termcolors = ''
        for cmd in sgr0 bold; do; tput $cmd; for i in $(seq 0 7); do; for j in $(seq 0 7); do; tput setaf $i; tput setab $j; echo -n " $i,$j "; done; tput sgr0; echo; tput $cmd; done; done
      '';
      watch = "watch -c -n 1 ";
      qemu-boot-bios = "qemu-system-x86_64 -enable-kvm -cpu host -smp 12 -m 8G -vga virtio --display gtk,full-screen=on,show-cursor=on";
      qemu-boot = "qemu-boot-bios -drive if=pflash,format=raw,unit=0,readonly=on,file=/usr/share/edk2-ovmf/OVMF_CODE.fd -drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd";
    };
  };
}
