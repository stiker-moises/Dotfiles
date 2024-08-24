{ config, pkgs, ... }:
{
programs = {
	hyprland.enable = true;
	steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
		];
	};
	zsh = {
  		enable = true;
  		autosuggestions.enable = true;
  		syntaxHighlighting.enable = true;
  		interactiveShellInit = "source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh";
	};
	neovim = {
  		enable = true;
  		defaultEditor = true;
	};
};


users.defaultUserShell = pkgs.zsh;
hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
};
environment.systemPackages = with pkgs; [
	alacritty
	ananicy-cpp
	ananicy-rules-cachyos
	bat
	bfcal
	blueberry
	copyq
	dconf
	deluge-gtk
	earlyoom
	easyeffects
	eza
	ffmpegthumbnailer
	firefox
	flat-remix-icon-theme
	galculator
	gammastep
	git
	gsettings-desktop-schemas
	gvfs
	handlr-regex
	hyprkeys
	hyprland
	hyprland-autoname-workspaces
	iwgtk
	jaq
	kdePackages.qt6ct
	kdePackages.qtstyleplugin-kvantum
	keyd
	libappindicator
	libnotify
	libsForQt5.ark
	libsForQt5.ffmpegthumbs
	libsForQt5.qt5ct
	libsForQt5.qtstyleplugin-kvantum
	light
	loupe
	mako
	mpv
	neovim
	nodejs-slim
	pavucontrol
	pcmanfm
	pinta
	pipewire
	polkit
	polkit_gnome
	posy-cursors
	power-profiles-daemon
	pulseaudio
	resources
	ripgrep
	sd
	slurp
	sound-theme-freedesktop
	speedread
	steam
	swayidle
	swaylock-effects
	swww
	tesseract
	themechanger
	thunderbird
	tofi
	waybar
	wayland-pipewire-idle-inhibit
	waypaper
	wayshot
	wireplumber
	wl-clipboard-rs
	wl-mirror
	wljoywake
	xdg-desktop-portal-hyprland
	xdg-user-dirs
	xwayland
	xwaylandvideobridge
	zim
	zsh
	zsh-autosuggestions
	zsh-history-substring-search
	zsh-syntax-highlighting
#	python312Packages.subliminal
];
fonts = {
	packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		noto-fonts-lgc-plus
		noto-fonts-monochrome-emoji
		nerdfonts
		font-awesome
	];
	fontDir.enable = true;
	fontconfig = {
		defaultFonts = {
			serif = [ "Noto Serif Medium" ];
			sansSerif = [ "Noto Sans Medium" ];
			monospace = [ "Noto Sans Mono Medium" ];
		};
	};
};
security = {
	rtkit.enable = true;
	sudo.enable = false;
	doas = {
		enable = true;
		extraRules = [{
			groups = [ "wheel" ];
			keepEnv = true;
			persist = true;
		}];
	};
};
services = {
	pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		pulse.enable = true;
		jack.enable = true;
	};
	power-profiles-daemon.enable = true;
	gvfs.enable = true;
	udisks2.enable = true;
	devmon.enable = true;
#	keyd = {
#		description = "key remapping daemon";
#		enable = true;
#		serviceConfig = {
#			Type = "simple";
#			ExecStart = "${pkgs.keyd}/bin/keyd";
#		};
#		wantedBy = [ "sysinit.target" ];
#		requires = [ "local-fs.target" ];
#		after = [ "local-fs.target" ];
#	};
	keyd.enable = true;
	udev.extraRules = ''
	SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="0",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver"
	SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="1",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance"
'';
	logind.extraConfig = ''
	HandlePowerKey=ignore
	HandlePowerKeyLongPress=poweroff
'';
	earlyoom.extraArgs = [ "-r 60 -m 3 -s 1 -n --avoid '(^|/)(init|Xorg|systemd|wlroots|Hyprland|sway|pipewire|wireplumber|pipewire-pulse|dbus-broker|dbus-broker-launch|earlyoom|mako|firefox|chromium|wfica|Xwayland|teams-for-linux|waybar|alacritty|nvim|gammastep|kanshi|easyeffects|swayidle|sworkstyle|hyprland-autoname-workspaces|swaddle|wljoywake)$'" ];
};
qt = {
	enable = true;
	platformTheme = "qt5ct";
};
boot = {
	kernelModules = [ "tcp_bbr" ];
	kernel.sysctl = {
		"net.ipv4.tcp_congestion_control" = "bbr";
		"fs.inotify.max_user_watches" = "100000";
		"net.core.default_qdisc" = "cake";
		"net.ipv4.tcp_fastopen" = "3";
		"net.ipv4.tcp_mtu_probing" = "1";
		"vm.swappiness" = "10";
		"kernel.printk" = "3 3 3 3";
	};
	kernelParams = [
#		"zswap.enabled=1"
#		"pcie_acs_override=downstream,multifunction"
		"amd_pstate=active"
#		"panic=1"
		"nowatchdog"
		"nmi_watchdog=0"
		"quiet"
		"rd.systemd.show_status=auto"
		"rd.udev.log_priority=3"
	];
	kernelPackages = pkgs.linuxPackages_zen;
};
}
