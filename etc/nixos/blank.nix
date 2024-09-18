{ config, pkgs, ... }:
{
imports = [
# uncomment your gpu
#	./amd.nix
#	./intel.nix
#	./nvidia.nix
];
environment.systemPackages = with pkgs; [
	#install things here
];
nixpkgs.config.permittedInsecurePackages = [
	#you may need this for certain packages
];
}
