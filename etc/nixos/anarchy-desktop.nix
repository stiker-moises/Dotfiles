{ config, pkgs, ... }:
{
boot.initrd.kernelModules = [ "amdgpu" ];
environment.systemPackages = with pkgs; [
	chromium
	citrix_workspace
	element-desktop
	spotifywm
	stoken
	teams-for-linux
	telegram-desktop
];
nixpkgs.config.permittedInsecurePackages = [
	"jitsi-meet-1.0.8043"
];
}
