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
  bufferline-nvim-git = pkgs.vimUtils.buildVimPlugin {
    name = "bufferline-nvim-git";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "874f869a24e568980294b3200fc9dd842db65a36";
      sha256 = "0b8fryf9cfcsg50r0cvwxrmcn6ip8r365nmdgd9qa1vaz2yx53dw";
    };
  };
in
{}
```

### Get sha256 hash for a commit
```
nix-prefetch-url --unpack https://github.com/<OWNER>/<REPONAME>/archive/<REV>.tar.gz
```
