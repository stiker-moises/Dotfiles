{ config, lib, pkgs, ... }:
{
imports = [
	./${lib.removeSuffix "\n" (builtins.readFile /etc/hostname)}.nix
];
programs = {
	hyprland.enable = true;
	hyprlock.enable = true;
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
	bato
	blueberry
	brightnessctl
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
	gnome-software
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
	qtalarm
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
	wl-restart
	wljoywake
	xclip
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
	polkit = {
		enable = true;
		extraConfig = ''
			polkit.addRule(function(action, subject) {
				if (
					subject.isInGroup("users")
					&& (
						action.id == "org.freedesktop.login1.reboot" ||
						action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
						action.id == "org.freedesktop.login1.power-off" ||
						action.id == "org.freedesktop.login1.power-off-multiple-sessions"
					)
				)
				{
					return polkit.Result.YES;
				}
			});
		'';
	};
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
xdg.portal = {
	enable = true;
	xdgOpenUsePortal = true;
	config = {
		common = {
			default = ["hyprland"];
			"org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
		};
	};
	extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
};
systemd = {
	services.flatpak-repo = {
		wantedBy = [ "multi-user.target" ];
		path = [ pkgs.flatpak ];
		script = ''
			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		'';
	};
	user.services.polkit-gnome-authentication-agent-1 = {
		description = "polkit-gnome-authentication-agent-1";
		wantedBy = [ "graphical-session.target" ];
		wants = [ "graphical-session.target" ];
		after = [ "graphical-session.target" ];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	};
};
services = {
	dbus.implementation = "broker";
	journald.storage = "none";
	greetd = {
		enable = true;
		settings = rec {
			default_session = {
				command = "${pkgs.wl-restart}/bin/wl-restart -n 20 ${pkgs.hyprland}/bin/Hyprland > /dev/null";
				user = config.services.getty.autologinUser;
			};
		};
	};
	kmscon = {
		enable = true;
		hwRender = true;
		autologinUser = config.services.getty.autologinUser;
	};
	flatpak.enable = true;
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
console = {
#	font = "ter-132n";
#	packages = [pkgs.terminus_font];
#	useXkbConfig = true;
	earlySetup = false;
};
boot = {
	plymouth = {
		enable = true;
		theme = "hexagon_red";
		themePackages = with pkgs; [
			(adi1090x-plymouth-themes.override {
			selected_themes = [ "hexagon_red" ];
			})
		];
	};
	consoleLogLevel = 0;
	initrd.verbose = false;
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
		"boot.shell_on_fail"
		"loglevel=3"
		"nmi_watchdog=0"
		"nowatchdog"
		"panic=5"
		"quiet"
		"rd.systemd.show_status=false"
		"rd.udev.log_level=3"
		"rd.udev.log_priority=3"
		"splash"
		"udev.log_priority=3"
	];
	kernelPackages = pkgs.linuxPackages_zen;
	loader = {
		timeout = 1;
		systemd-boot.consoleMode = "max";
	};
};
environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";
	MOZ_ENABLE_WAYLAND = "1";
	HOSTNAME = config.networking.hostName;
};
fileSystems."/" = {
	options = [
		"noatime"
		"nodiratime"
		"discard"
	];
};

}
