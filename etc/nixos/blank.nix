{ config, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
	#install things here
];
nixpkgs.config.permittedInsecurePackages = [
	#you may need this for certain packages
];
}
