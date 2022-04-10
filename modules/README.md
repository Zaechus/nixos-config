# Modules

## *-home

`nix` files with the `-home` name suffix are for use with [Home Manager](https://github.com/nix-community/home-manager)
and should be placed into user imports.

## NixOS Modules

### Default
`default.nix` and `home.nix` contain basic functionality/configuration that should
be shared by most systems and users.

### Wired & Wireless
Provides networking functionality for wired and wireless connecetions respectively.
Uses systemd-networkd for both and `iwd` for wireless.

### Graphical
Enables the use of swaywm, an internet browser, and other graphical utilities.

### Dev
Packages needed for software development.

### Laptop
Enables additional packages and settings for laptop computers.

### Thinkpad
Thinkpad-specific configuration.
