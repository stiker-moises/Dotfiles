{ config, pkgs, ... }:
{
programs = {
	hyprland.enable = true;
	hyprlock.enable = true;
	light.enable = true;
	steam = {
		enable = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		remotePlay.openFirewall = true;
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
	doas-sudo-shim
	dua
	earlyoom
	easyeffects
	eza
	ffmpegthumbnailer
	firefox
	flat-remix-icon-theme
	galculator
	gammastep
	git
	gnome-power-manager
	gsettings-desktop-schemas
	gvfs
	handlr-regex
	hyprkeys
	hyprland
	hyprland-autoname-workspaces
	hyprlock
	iwgtk
	jaq
	kdePackages.ark
	kdePackages.ffmpegthumbs
	kdePackages.qt6ct
	libsForQt5.qtstyleplugin-kvantum
	kdePackages.qtstyleplugin-kvantum
	keyd
	killall
	libappindicator
	libnotify
	libsForQt5.qt5ct
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
#	python312Packages.subliminal
	resources
	ripgrep
	sd
	slurp
	sound-theme-freedesktop
	speedread
	steam
	swayidle
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
	xclip
	xdg-desktop-portal-hyprland
	xdg-user-dirs
	xdg-utils
	xwayland
	xwaylandvideobridge
	zim
	zsh
	zsh-autosuggestions
	zsh-history-substring-search
	zsh-syntax-highlighting
];
fonts = {
	packages = with pkgs; [
		font-awesome
		(nerdfonts.override { fonts = [ "Noto" ]; })
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		noto-fonts-lgc-plus
		noto-fonts-monochrome-emoji
	];
	fontDir.enable = true;
	fontconfig = {
		defaultFonts = {
			monospace = [ "Noto Sans Mono Medium" ];
			sansSerif = [ "Noto Sans Medium" ];
			serif = [ "Noto Serif Medium" ];
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
			noLog = true;
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
	earlyoom = {
		enable = true;
		enableNotifications = true;
		extraArgs = [ "-r 60 -M 2048 -S 1024"
		"--avoid '(^|/)(init|Xorg|systemd|wlroots|Hyprland|sway|pipewire|wireplumber|pipewire-pulse|dbus-broker|dbus-broker-launch|earlyoom|mako|firefox|chromium|wfica|Xwayland|teams-for-linux|waybar|alacritty|nvim|gammastep|kanshi|easyeffects|swayidle|sworkstyle|hyprland-autoname-workspaces|swaddle|wljoywake)$'" ];
	};
	devmon.enable = true;
	gvfs.enable = true;
	power-profiles-daemon.enable = true;
	udisks2.enable = true;
	ananicy =  {
		enable = true;
		package = pkgs.ananicy-cpp;
		rulesProvider = pkgs.ananicy-rules-cachyos;
	};
	keyd.enable = true;
	udev.extraRules = ''
	SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="0",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver"
	SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="1",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance"
	'';
	logind.extraConfig = ''
		HandlePowerKey=ignore
		HandlePowerKeyLongPress=poweroff
	'';
};
qt = {
	enable = true;
	platformTheme = "qt5ct";
};
boot = {
	kernelModules = [ "tcp_bbr" ];
	kernel.sysctl = {
		"fs.inotify.max_user_watches" = "100000";
		"kernel.printk" = "3 3 3 3";
		"net.core.default_qdisc" = "cake";
		"net.ipv4.tcp_congestion_control" = "bbr";
		"net.ipv4.tcp_fastopen" = "3";
		"net.ipv4.tcp_mtu_probing" = "1";
		"vm.swappiness" = "10";
	};
	kernelParams = [
		"amd_pstate=active"
		"loglevel=3"
		"nmi_watchdog=0"
		"nowatchdog"
		"panic=5"
		"quiet"
		"rd.systemd.show_status=auto"
		"rd.udev.log_priority=3"
	];
	kernelPackages = pkgs.linuxPackages_zen;
	loader.timeout = 1;
};
environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";
	MOZ_ENABLE_WAYLAND = "1";
};
fileSystems."/" = {
	options = [
		"noatime"
		"nodiratime"
		"discard"
	];
};

}
