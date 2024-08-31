```
install script
==============

Step 1. Install NixOS

Step 2. Get the script ready, make sure to delete the dotfiles folder when you're done

$ nmtui

connect to wifi

$ nix-shell -p git

$ git clone https://gitlab.com/that1communist/dotfiles.git 

$ cd dotfiles

$ cp ./.z* ~/

$ sudo cp -n ./etc/nixos/ /etc/nixos/

$ sudo nano /etc/nixos/configuration.nix

set hostname, import sys.nix/(intel amd nvidia).nix

$ sudo nixos-rebuild switch --upgrade

$ zsh

$ setupeverything

$ snv /etc/nixos/configuration.nix

hash out networkmanager line, add iwd to imports

Step 4. Optional .nix files:

$ doas cp /tmp/dotfiles/etc/nixos/(cat /etc/hostname).nix /etc/nixos/