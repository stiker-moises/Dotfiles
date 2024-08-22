# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
	boot.initrd.kernelModules = [ "amdgpu" ];
  	# List packages installed in system profile. To search, run:
  	# $ nix search wget
  	environment.systemPackages = with pkgs; [
  		telegram-desktop
#  		nheko
  		element-desktop
		stoken
		citrix_workspace
		ungoogled-chromium
		teams-for-linux
		spotifywm
  		];
	nixpkgs.config.permittedInsecurePackages = [
        	"jitsi-meet-1.0.8043"
        	];
}
