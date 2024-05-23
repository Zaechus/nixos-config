# network

Check open ports
```sh
sudo ss -tunlp
```

Check allowed ports:
```sh
sudo iptables -nL
```

Disable firewall:
```nix
networking.firewall.enable = false;
```
