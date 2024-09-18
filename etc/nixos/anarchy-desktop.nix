{ config, pkgs, ... }:
{
imports = [
	./amd.nix
];
environment.systemPackages = with pkgs; [
	bsnes-hd
	cemu
	chromium
	citrix_workspace
	discord
	dolphin-emu
	element-desktop
	gamescope
	gnome-boxes
	mgba
	obs-studio
	r2modman
	ryujinx
	spotifywm
	stoken
	teams-for-linux
	telegram-desktop
	wineWow64Packages.waylandFull
#	cosmic-osd
#	cosmic-store
#	cosmic-settings
];

nixpkgs.config.permittedInsecurePackages = [
	"jitsi-meet-1.0.8043"
	"electron-29.4.6"
];
#services.udev.extraRules = ''
#  ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1484" ATTR{power/wakeup}="disabled"
#'';
#virtualisation.libvirtd.enable = true;
#environment.sessionVariables = {
#	CMAKE_C_COMPILER="{pkgs.gcc}/bin/gcc"
#};
}
