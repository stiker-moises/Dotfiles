{ config, pkgs, ... }:
{
boot.initrd.kernelModules = [ "amdgpu" ];
environment.systemPackages = with pkgs; [
	chromium
	citrix_workspace
	element-desktop
	spotifywm
	mgba
	cemu
	ryujinx
	bsnes-hd
	dolphin-emu
	stoken
	teams-for-linux
	telegram-desktop
];
nixpkgs.config.permittedInsecurePackages = [
	"jitsi-meet-1.0.8043"
	"electron-29.4.6"
];
services.udev.extraRules = ''
  ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1484" ATTR{power/wakeup}="disabled"
'';
}
