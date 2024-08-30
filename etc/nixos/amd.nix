{ config, pkgs, ... }:
{
boot.initrd.kernelModules = [ "amdgpu" ];
services.xserver.videoDrivers = [ "amdgpu" ];
hardware.opengl = {
	enable = true;
};
}
