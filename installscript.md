```
install script
==============

Step 1. Install Arch

$ iwctl
$ station wlan0 'wifiname'
$ exit
$ archinstall
	a. f2fs if ssd, ext4 if hdd
	b. linux-zen
	c. install git iwd zsh 
	d. enable multilib
	e. Systemd-boot

Step 2. Get the script ready, make sure to delete the dotfiles folder when you're done

$ git clone https://gitlab.com/that1communist/dotfiles.git && cd dotfiles && cp ./.z* ~/ && zsh

$ setupeverything

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

Step 4. Optional packages:

$ ins telegram-desktop-userfonts-bin adwaita-for-steam nheko

Step 5. Setup seahorse
open seahorse
Plus at the top left
password keyring

If you don't want to be prompted for a password every time, leave it blank, if you want everything to be extra secure, give it a password.
	  
```
