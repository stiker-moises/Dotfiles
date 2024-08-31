{ config, pkgs, ... }:
{
networking = {
	networkmanager.enable = false;
	nameservers = [ "1.1.1.1" "9.9.9.9" ];
	wireless.iwd = {
		enable = true;
		settings = {
			IPv6 = {
				Enabled = true;
			};
			Settings = {
				AutoConnect = true;
			};
		};
	};
};
}

