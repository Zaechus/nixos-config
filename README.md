# nixos-config

[![](https://img.shields.io/badge/OS-NixOS-6e9bcb?logo=NixOS)](https://nixos.org)

My NixOS configuration

## [NixOS Installation](https://nixos.org/download.html#nixos-iso)
```
sudo ./install.sh
```

### Get Without Git
```
curl -OL https://github.com/zaechus/nixos-config/archive/main.tar.gz
tar xzf main.tar.gz
cd nixos-config-main
```

### Configuration Setup
```
./setup.sh $HOST
passwd $USER
```

## [Nix](https://nixos.org/download.html#nix-install-linux) + [Home Manager](https://nix-community.github.io/home-manager/index.html#sec-flakes-standalone)
```
sh <(curl -L https://nixos.org/nix/install) --daemon
```
```
./nix.sh $USER
```
