{ config, pkgs, ... }:
{
	boot.initrd.kernelModules = [ "amdgpu" ];
  	environment.systemPackages = with pkgs; [
  		telegram-desktop
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
