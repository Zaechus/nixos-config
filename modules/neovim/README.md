# [Neovim](https://neovim.io/)

## Plugins
- [barbar](https://github.com/romgrk/barbar.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua/)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-nix](https://github.com/LnL7/vim-nix)

## Use plugins from GitHub

```
let
  melange = pkgs.vimUtils.buildVimPlugin {
    name = "melange";
    src = pkgs.fetchFromGitHub {
      owner = "savq";
      repo = "melange";
      rev = "ede563c0ed19c821d42006bdacdbb3515620865e";
      sha256 = "1v0arh3cr1bqzipv8pgn9vknnsrd6cv9k2kvzcsdwdfqaw1pnlx1";
    };
  };
in
{}
```

### Get sha256 hash for a commit
```
nix-prefetch-url --unpack https://github.com/<OWNER>/<REPONAME>/archive/<REV>.tar.gz
```
