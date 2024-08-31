{ config, pkgs, ... }:
{
hardware.graphics.enable = true;
hardware.opengl = {
	extraPackages = with pkgs; [
		vpl-gpu-rt
#		onevpl-intel-gpu
		intel-media-driver # LIBVA_DRIVER_NAME=iHD
		intel-vaapi-driver # LIBVA_DRIVER_NAME=i965
		libvdpau-va-gl
	];
};
environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
}

