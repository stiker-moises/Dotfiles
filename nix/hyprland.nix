# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  nixpkgs.config.packageOverrides = pkgs: {
  	intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
	};
  hardware.opengl = {
  	enable = true;
  	extraPackages = with pkgs; [
  		intel-media-driver
  		intel-vaapi-driver
  		libvdpau-va-gl
  	];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    ananicy-cpp
    ananicy-rules-cachyos
    libsForQt5.ark
    bat
    blueberry
    copyq
    deluge-gtk
    earlyoom
    easyeffects
    eza
    ffmpegthumbnailer
    sound-theme-freedesktop
    libsForQt5.ffmpegthumbs
    firefox
    flat-remix-icon-theme
    galculator
    gammastep
    git
    glib
    gsettings-desktop-schemas
    libnotify
    wayshot
    handlr-regex
    hyprkeys
    hyprland
    hyprland-autoname-workspaces
    iwgtk
    jaq
    keyd
    themechanger
    pipewire
    wireplumber
    light
    loupe
    mako
    mpv
    neovim
    noto-fonts-monochrome-emoji
    pavucontrol
    lxqt.pcmanfm-qt
    pinta
    polkit
    polkit_gnome
    power-profiles-daemon
#    proton-ge-bin
    libsForQt5.qt5ct
    kdePackages.qt6ct
    resources
    ripgrep
    sd
    slurp
    speedread
    steam
#    python312Packages.subliminal
    swww
    waypaper
    swayidle
    swaylock-effects
    tesseract
    thunderbird
    tofi
    waybar
    wayland-pipewire-idle-inhibit
    wl-clipboard-rs
    wl-mirror
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    wljoywake
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    xwayland
    xwaylandvideobridge
    zim
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-lgc-plus
    nerdfonts
    font-awesome
  ];
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
  };
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
  groups = [ "wheel" ];
  keepEnv = true;
  persist = true;
}];
  systemd.services.keyd = {
    description = "key remapping daemon";
    enable = true;
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.keyd}/bin/keyd";
    };
    wantedBy = [ "sysinit.target" ];
    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];
  };
}
