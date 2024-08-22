# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
	programs.hyprland.enable = true;
	programs.steam.enable = true;
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	environment.systemPackages = with pkgs; [
    alacritty
    home-manager
    gvfs
    pulseaudio
    ananicy-cpp
    ananicy-rules-cachyos
    libsForQt5.ark
    bat
    blueberry
    copyq
    dconf-editor
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
    pavucontrol
    lxqt.pcmanfm-qt
    pinta
    polkit
    polkit_gnome
    power-profiles-daemon
#    proton-ge-bin
	protonup-qt
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
    libappindicator
    gtk3
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-lgc-plus
    noto-fonts-monochrome-emoji
    nerdfonts
    font-awesome
  ];
fonts = {
  fontconfig = {
    defaultFonts = {
      		serif = [  "Noto Serif Medium" ];
      		sansSerif = [ "Noto Sans Medium" ];
      		monospace = [ "Noto Sans Mono Medium" ];
    };
  };
};

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
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  environment.variables = rec {
    GSETTINGS_SCHEMA_DIR="${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };
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
  	qt = {
  		enable = true;
  		platformTheme = "qt5ct";
	};
}
