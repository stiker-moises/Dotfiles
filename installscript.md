```
install script
==============

Step 1. Install NixOS



Step 2. Get the script ready, make sure to delete the dotfiles folder when you're done

$ nmtui

$ git clone https://gitlab.com/that1communist/dotfiles.git && cd dotfiles && cp ./.z* ~/ && cp ./etc/nixos/sys.nix /etc/nixos/sys.nix

$ nano /etc/nixos/configuration.nix

set hostname/import sys.nix

$ sudo nixos-rebuild switch --upgrade

Step 3. Do one of the system-specific commands, should be one of the following:

Open source nvidia setup
$ setupnouveau

Proprietary nvidia setup
$ setupnvidiabad

AMD is the only simple one, fuck everyone else
$ setupamd

Intel for cards post-2017
$ setupintel

Intel for cards pre-2017
$ setupintelold

Step 4. Optional .nix files:

cp /tmp/dotfiles/etc/nixos/(cat /etc/hostname).nix /etc/nixos/