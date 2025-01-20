# nixos-config

[![](https://img.shields.io/badge/OS-NixOS-6e9bcb?logo=NixOS)](https://nixos.org)

My NixOS configuration

## [NixOS Installation](https://nixos.org/download.html#nixos-iso)
```sh
sudo ./install.sh
sudo nixos-install --flake .#<hostname>
```

### Get Without Git
```sh
curl -OL https://github.com/Zaechus/nixos-config/archive/main.tar.gz
tar xzf main.tar.gz
cd nixos-config-main
```

### Configuration Setup
```sh
./setup.sh $HOST
passwd $USER
```
