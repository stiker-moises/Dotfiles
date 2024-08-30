# Edit this configuration file to define what should be installed on
# your system.Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
imports = [
	./hardware-configuration.nix
	./sys.nix
	./anarchy-desktop.nix
	./amd.nix
];

# Bootloader.
boot.loader = { 
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
};
networking = {
	hostName = "anarchy-desktop";
	networkmanager.enable = false;
	wireless.iwd.settings = {
		IPv6 = {
			Enabled = true;
		};
		Settings = {
			AutoConnect = true;
		};
	};
};
# Set your time zone.
time.timeZone = "America/Indiana/Indianapolis";

# Select internationalisation properties.
i18n = {
	defaultLocale = "en_US.UTF-8";
	extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};
};

# Configure console keymap
console.keyMap = "us";

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.communist = {
	isNormalUser = true;
	description = "Communist";
	extraGroups = [ "network" "wheel" ];
};

# Enable automatic login for the user.
services.getty.autologinUser = "communist";

# Allow unfree packages
nixpkgs.config.allowUnfree = true;
# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
# enable = true;
# enableSSHSupport = true;
# };
system.stateVersion = "24.05"; # Did you read the comment?
}
