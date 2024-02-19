#setopts
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
unsetopt BG_NICE
setopt CORRECT
setopt EXTENDED_HISTORY
setopt MENUCOMPLETE
setopt ALL_EXPORT
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

### Set prompt
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="┌[%(!.${PR_RED}%2c.${PR_BLUE}%2c)$PR_NO_COLOR]%(?..[${PR_LIGHT_RED}%?$PR_NO_COLOR])%(!.${PR_LIGHT_RED}#.${PR_LIGHT_GREEN}
$PR_NO_COLOR└) "
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
unsetopt ALL_EXPORT

### Set alias
#############
alias ll='exa -al'
alias upd='echo "Safe updates can be accomplished with supd" &! paru -Syu --noconfirm && notify-send --urgency=low "UNSAFE Update completed" && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias supd='paru -Syu --confirm --review && notify-send --urgency=low "Safe Update completed" && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias updd='doas reflector --protocol https --threads 4 --latest 20 --sort rate --save /etc/pacman.d/mirrorlist && notify-send --urgency=low "Mirrorlists updated" && paru -Syu --noconfirm && notify-send --urgency=low "Update completed" && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias ins='paru -S'
alias uin='paru -R'
alias pur='paru -Rns'
alias arm='paru -Rsc'
alias pacl='paru -Sc && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias orphans='paru -Qtdq | paru -Rns - && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias sl=exa
alias snv=doasedit
alias nv=nvim
alias reflect='doas reflector --protocol https --threads 4 --latest 200 --fastest 50 --sort rate --save /etc/pacman.d/mirrorlist && notify-send --urgency=low "Mirrorlist updated" && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias sync='sync && notify-send --urgency=low "Sync completed" && pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias isomount="mount -o loop"
alias bt=bat
alias cat=bat
alias ls=exa
alias purge="echo 'you mean pur'"
alias clean="echo 'you mean pacl'"
alias pls="doas !!"
alias overwrite="paru -Syu --overwrite '*' && pw-play --volume=0.2 '/usr/share/sounds/freedesktop/stereo/complete.oga' &!"
alias ..='cd ..'
alias sudo=doas
alias vpn='doas systemctl start nordvpnd && nordvpn connect'
alias vpnd='nordvpn disconnect && doas systemctl stop nordvpnd'
alias gamesound="pactl load-module module-combine-sink sink_name='Game' slaves='easyeffects_sink'"
alias setupeverything="touch ~/.hushlogin ; rm -rf /tmp/dotfiles ; rm -rf /tmp/paru-bin ; cd /tmp/ && git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && gpg --recv-keys E41FF9C889B141CC ; env CFLAGS='-march=native -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection' RUSTFLAGS='-C opt-level=2 -C target-cpu=native' MAKEFLAGS='-j$(nproc)' makepkg -si && cd /tmp/ && git clone https://gitlab.com/that1communist/dotfiles.git && cd ./dotfiles && /bin/sudo chown -R $USER:$USER ./.* && chmod -R 750 ./.* && cp -r ./.* ~/ ; /bin/sudo cp -r ./etc / ; cd ~ ; /bin/sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 20/g' /etc/pacman.conf && /bin/sudo usermod -a -G video $LOGNAME && env CFLAGS='-march=native -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection' RUSTFLAGS='-C opt-level=2 -C target-cpu=native' MAKEFLAGS='-j$(nproc)' paru --sudo=sudo --needed -S alacritty alsa-tools alsa-utils ananicy-cpp-git cachyos-ananicy-rules-git  android-udev ark bat bato bison bluez-utils bzip2 catch2 ccache chezmoi copyq cpupower doasedit earlyoom easyeffects egl-wayland exa ffmpegthumbnailer ffmpegthumbs firefox flat-remix galculator gamemode gamescope gammastep glfw-wayland gnome-keyring gparted grim gst-plugin-pipewire gst-plugin-qmlgl gtk3-classic gucharmap gvfs gvfs-mtp gzip handlr loupe iwgtk jq kanshi keyd-git ksysguard kvantum kwayland-integration lib32-libva-mesa-driver lib32-pipewire-jack lib32-vkd3d lib32-vulkan-icd-loader libappindicator-gtk3 libva-mesa-driver light linux-firmware mako mpv neovim neovim-coc-bin neovim-symlinks noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra opendoas otf-font-awesome p7zip pavucontrol pbzip2 pcmanfm-qt paruz pigz pinta polkit-gnome profile-sync-daemon proton-ge-custom-bin protonhax-git protontricks qbittorrent qt5-wayland qt5ct qt6-wayland qt6ct qtalarm realtime-privileges reflector rsync seahorse slurp speedread-git steam swayfx swaybg swayidle swaylock-effects-git sworkstyle syncplay thermald thunderbird tofi ttf-nerd-fonts-symbols-mono unarchiver unrar vkd3d vim-hexokinase vulkan-headers vulkan-mesa-layers vulkan-validation-layers waybar wdisplays wine-gecko wine-mono wine-staging winetricks wljoywake wl-clipboard wl-mirror xdg-desktop-portal-wlr xdg-user-dirs xdg-utils-handlr xorg-xwayland xz zim zsh zsh-autosuggestions zsh-syntax-highlighting ; handlr set application/x-extension-htm firefox.desktop ; handlr set application/x-extension-html firefox.desktop ; handlr set application/x-extension-shtml firefox.desktop ; handlr set application/x-extension-xht firefox.desktop ; handlr set application/x-extension-xhtml firefox.desktop ; handlr set application/xhtml+xml firefox.desktop ; handlr set 'image/*' org.gnome.Loupe.desktop ; handlr set image/png org.gnome.Loupe.desktop ; handlr set image/jpeg org.gnome.Loupe.desktop ; handlr set image/gif mpv.desktop ; handlr set 'video/*' mpv.desktop ; handlr set x-scheme-handler/about firefox.desktop ; handlr set x-scheme-handler/chrome firefox.desktop ; handlr set x-scheme-handler/feed firefox.desktop ; handlr set x-scheme-handler/file pcmanfm-qt.desktop ; handlr set x-scheme-handler/ftp firefox.desktop ; handlr set x-scheme-handler/http firefox.desktop ; handlr set x-scheme-handler/https firefox.desktop ; handlr set inode/directory pcmanfm-qt.desktop ; handlr set application/x-bittorrent org.qbittorrent.qBittorrent.desktop ; handlr set application/x-bittorrent org.qbittorrent.qBittorrent.desktop ; handlr set x-scheme-handler/magnet org.qbittorrent.qBittorrent.desktop ; handlr set x-scheme-handler/steam steam.desktop ; /bin/sudo systemctl enable thermald ; /bin/sudo systemctl enable earlyoom ; /bin/sudo systemctl enable lm_sensors ; /bin/sudo systemctl enable ananicy-cpp ; /bin/sudo systemctl enable paccache ; /bin/sudo systemctl enable systemd-timesyncd.service ; systemctl --user enable gamemoded ; systemctl --user enable psd.service ; /bin/sudo systemctl enable keyd ; xdg-user-dirs-update ; mkdir -p ~/Pictures/.clipboard/ ; mkdir -p ~/.local/share/zsh/ ; mkdir ~/Torrents ; /bin/sudo sed -i 's/timeout 3/timeout 0/g' /boot/loader/loader.conf ; /bin/sudo sed -i 's/options root/options quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3 nowatchdog root/g' /boot/loader/entries/*.conf ; /bin/sudo sed -i 's/username/'$USER'/g' /etc/systemd/system/getty@tty1.service.d/skip-prompt.conf ; /bin/sudo sed -i 's/username/'$USER'/g' ~/.config/qBittorrent/qBittorrent.conf ; /bin/sudo sed -i 's/username/'$USER'/g' ~/.config/pcmanfm-qt/default/settings.conf ; /bin/sudo sed -i 's/username/'$USER'/g' ~/.config/gtk-3.0/bookmarks ; /bin/sudo sed -i 's/relatime/noatime/g' /etc/fstab ; gsettings set com.github.wwmm.easyeffects.streaminputs plugins \"['rnnoise#0', 'speex#0', 'echo_canceller', 'compressor']\" ; gsettings set com.github.wwmm.easyeffects.speex:/com/github/wwmm/easyeffects/streaminputs/speex/0/ enable-denoise false ; gsettings set com.github.wwmm.easyeffects.speex:/com/github/wwmm/easyeffects/streaminputs/speex/0/ enable-dereverb true ; chmod +x ~/.config/tofi/scripts/power.sh ; chsh -s /bin/zsh ; /bin/sudo chsh -s /bin/zsh ; pw-play --volume=0.2 '/usr/share/sounds/freedesktop/stereo/complete.oga'"
alias updatedots="cd /tmp/ ; rm -rf ./dotfiles ; git clone https://gitlab.com/that1communist/dotfiles.git && cd dotfiles && doas chown -R $USER:$USER ./.* && doas chmod -R 750 ./.* && rm -rf ./.config/fontconfig ; rm -rf ./.config/gtk-3.0 ; rm -rf ./.config/handlr ; rm -rf ./.config/kanshi ; rm -rf ./.config/qBittorrent ; rm -rf ./.config/qt5ct rm -rf ./.config/mimeapps.list ; rm -rf ./.config/QTalarm/ ; rm -rf ./.config/syncplay ; rm -rf ./.config/galculator ; rm -rf ./.config/mpv/ ; rm -rf ./.config/gammastep ; rm -rf ./.config/firefox ; rm -rf .config/sway/wallpaper && cp -r ./.* ~/ && doas cp -r ./etc / ; cd ~ ; doas sed -i 's/username/'$USER'/g' /etc/systemd/system/getty@tty1.service.d/skip-prompt.conf ; doas sed -i 's/username/'$USER'/g' ~/.config/qBittorrent/qBittorrent.conf ; doas sed -i 's/username/'$USER'/g' ~/.config/pcmanfm-qt/default/settings.conf ; doas sed -i 's/username/'$USER'/g' ~/.config/gtk-3.0/bookmarks ; doas sed -i 's/relatime/noatime/g' /etc/fstab ; zsh ; pw-play --volume=0.2 '/usr/share/sounds/freedesktop/stereo/complete.oga'" 
alias setupnvidiaopendonotuse="printf 'LIBVA_DRIVER_NAME=nouveau\nVDPAU_DRIVER=nouveau' | doas tee /etc/environment doas sed -i 's/nowatchdog root/nowatchdog nvidia_drm.modeset=1 root/g' /boot/loader/entries/*.conf &! printf 'options nvidia-drm modeset=1/noptions nvidia NVreg_UsePageAttributeTable=1/noptions nvidia NVreg_RegistryDwords=\"OverrideMaxPerf=0x1\"\n' | doas tee /etc/modprobe.d/nvidia.conf &! paru -S nvidia-open-dkms libva-mesa-driver mesa-vdpau ; pw-play --volume=0.2 '/usr/share/sounds/freedesktop/stereo/complete.oga' &!"
alias setupnouveau='printf "LIBVA_DRIVER_NAME=nouveau\nVDPAU_DRIVER=nouveau" | doas tee /etc/environment doas sed -i "s/nowatchdog root/nowatchdog nvidia_drm.modeset=1 root/g" /boot/loader/entries/*.conf &! printf "options nvidia-drm modeset=1/noptions nvidia NVreg_UsePageAttributeTable=1/noptions nvidia NVreg_RegistryDwords="OverrideMaxPerf=0x1"/n" | doas tee /etc/modprobe.d/nvidia.conf &! paru -S lib32-libva-mesa-driver libva-mesa-driver lib32-mesa-vdpau mesa-vdpau ; paru -R amdvlk lib32-amdvlk nvidia-utils nvidia-dkms lib32-nvidia-utils vulkan-intel lib32-vulkan-intel libva-intel-driver intel-media-driver vulkan-radeon lib32-vulkan-radeon ; pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias setupnvidiabad='printf "LIBVA_DRIVER_NAME=nvidia\nVDPAU_DRIVER=nvidia" | doas tee /etc/environment &! doas sed -i "s/nowatchdog root/nowatchdog nvidia_drm.modeset=1 root/g" /boot/loader/entries/*.conf &! printf "options nvidia-drm modeset=1/noptions nvidia NVreg_UsePageAttributeTable=1/noptions nvidia NVreg_RegistryDwords="OverrideMaxPerf=0x1"/n" | doas tee /etc/modprobe.d/nvidia.conf &! paru -S nvidia-utils nvidia-dkms lib32-nvidia-utils lib32-mesa-vdpau mesa-vdpau lib32-libva-mesa-driver ; paru -R amdvlk lib32-amdvlk nvidia-utils nvidia-dkms lib32-nvidia-utils vulkan-intel lib32-vulkan-intel libva-intel-driver intel-media-driver vulkan-radeon lib32-vulkan-radeon ; pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias setupamd='printf "LIBVA_DRIVER_NAME=radeonsi\nVDPAU_DRIVER=radeonsi" | doas tee /etc/environment &! doas sed -i "s/nowatchdog nvidia_drm.modeset=1 root/nowatchdog root/g" &! sudo rm /etc/modprobe.d/nvidia.conf &! paru -S vulkan-radeon lib32-vulkan-radeon libva-mesa-driver linux-firmware lib32-libva-mesa-driver lib32-mesa-vdpau mesa-vdpau ; paru -R amdvlk lib32-amdvlk nvidia-utils nvidia-dkms lib32-nvidia-utils vulkan-intel lib32-vulkan-intel libva-intel-driver intel-media-driver ; pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias setupintel='printf "LIBVA_DRIVER_NAME=iHD\nVDPAU_DRIVER=va_gl" | doas tee /etc/environment &! doas sed -i "s/nowatchdog nvidia_drm.modeset=1 root/nowatchdog root/g" &! sudo rm /etc/modprobe.d/nvidia.conf &! paru -S vulkan-intel lib32-vulkan-intel intel-media-driver ; paru -R amdvlk lib32-amdvlk nvidia-utils nvidia-dkms lib32-nvidia-utils libva-intel-driver vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver lib32-mesa-vdpau mesa-vdpau ; pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias setupintelold='printf "LIBVA_DRIVER_NAME=i965\nVDPAU_DRIVER=va_gl" | doas tee /etc/environment &! doas sed -i "s/nowatchdog nvidia_drm.modeset=1 root/nowatchdog root/g" &! sudo rm /etc/modprobe.d/nvidia.conf &! paru -S vulkan-intel lib32-vulkan-intel libva-intel-driver ; paru -R amdvlk lib32-amdvlk nvidia-utils nvidia-dkms lib32-nvidia-utils intel-media-driver vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver lib32-mesa-vdpau mesa-vdpau ; pw-play --volume=0.2 "/usr/share/sounds/freedesktop/stereo/complete.oga" &!'
alias installer='paruz'
### Bind keys

autoload -U compinit
compinit
bindkey -e
bindkey '^?' backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '[[5~' up-line-or-history
bindkey '[[6~' down-line-or-history
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
HISTFILE=~/.local/share/zsh/histfile
HISTSIZE=1024
SAVEHIST=4096
setopt autocd extendedglob
unsetopt beep nomatch
zstyle :compinstall filename '~/.config/.zshrc'
autoload -Uz compinit
compinit
