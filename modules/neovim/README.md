# Neovim

## Use plugins from GitHub

```
let
  tokyonight = pkgs.vimUtils.buildVimPlugin {
    name = "tokyonight";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "8223c970677e4d88c9b6b6d81bda23daf11062bb";
      sha256 = "1rzg0h0ab3jsfrimdawh8vlxa6y3j3rmk57zyapnmzpzllcswj0i";
    };
  };
in
{}
```

### Get sha256 hash for a commit
```
nix-prefetch-url --unpack https://github.com/<OWNER>/<REPONAME>/archive/<REV>.tar.gz
```
