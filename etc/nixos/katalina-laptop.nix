{ config, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
	chromium
];
nixpkgs.config.permittedInsecurePackages = [
];
}
