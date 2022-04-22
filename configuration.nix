# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{


  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9"
  ];

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
  


  imports =
    [ # Include the results of the hardware scan.
      #<nixos-hardware/apple/macbook-pro/12-1>
      
      ./hardware-configuration.nix
    ];
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
  
  };
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages-libre;
  services.flatpak.enable = true;
  services.xserver.wacom.enable = true;
  services.xserver.digimend.enable = true;
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  #auto-optimise-store = true;
  
  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.kernelPackages = pkgs.linuxPackages_zen;
  #boot.kernelPackages = pkgs.linuxPackages_libre;
#   services.v2ray.enable = true;
  virtualisation.docker.enable = true;
  # services.amule.enable = true;
  # services.amule.user = "yisui";
  # users.yisui.extraGroups = [ "docker" ];
  fonts.fonts = with pkgs; [
    
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    google-fonts
    meslo-lgs-nf
    #nerdfonts
    fira-code-symbols
    #vistafonts-chs
    dina-font
    proggyfonts
    source-han-serif
    source-han-sans
    pkgs.sarasa-gothic
    ubuntu_font_family
  ];

  #fonts.fonts = [ "pkgs.dejavu_fonts" "pkgs.noto-fonts-cjk" "pkgs.sarasa-gothic" "ubuntu_font_family" ];
  programs.fish.enable = true;
  virtualisation.virtualbox.host.enable = true;
  # virtualisation.libvirtd.enableKVM = true;
  virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
  users.extraGroups.vboxusers.members = [ "yisui" ];
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  # environment.systemPackages = with pkgs; [ virt-manager ];
  # Use the systemd-boot EFI boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.grub.efiSupport = true;
  #boot.loader.grub.theme = pkgs.nixos-grub2-theme;
  #boot.loader.grub.devices = [ "nodev" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # boot.kernelPackages = pkgs.linux_5_15_hardened;
  # nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.binaryCaches = [ "https://mirror.sjtu.edu.cn/nix-channels/store" "https://mirrors.bfsu.edu.cn/nix-channels/store" ];
  networking.hostName = "yisuidembp"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp0s3.useDHCP = true;
  networking.networkmanager.enable = true;
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-rime ];
  #i18n.inputMethod.enabled = "ibus";
  #i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ rime ];
  
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.windowManager.openbox.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.windowManager.bspwm.enable = true;
  
  #services.xserver.desktopManager.cinnamon.enable = true;
  #programs.pantheon-tweaks.enable = true;
  
  hardware.opengl.driSupport32Bit = true;
  
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.desktopManager.plasma5.useQtScaling = true;
  programs.kdeconnect.enable = true;


  services.upower.enable = true;

  #services.xserver.windowManager.i3-gaps.enable = true;
  #services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  #programs.sway.enable = true;
  #programs.sway.extraPackages = with pkgs; [ swaylock swayidle dmenu i3status i3status-rust  light ];
  #services.xserver.windowManager.i3.enable = true;
  #services.xserver.windowManager.i3.extraPackages = [ dmenu i3status i3lock feh polybar light ];
  #services.xserver.windowManager.xmonad.enable = true;
 
  #services.xserver.desktopManager.cinnamon.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;

  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yisui = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
  };
  


  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;
  security.doas.enable = true;
  # ervices.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.desktopManager.mate.enable = true;
  #environment.mate.excludePackages = [ pkgs.mate.mate-terminal pkgs.mate.pluma ];
  # programs.pantheon-tweaks.enable = true;
  # services.pantheon.files.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    wqy_zenhei
    virt-manager


#    nerdfonts

    appimage-run
    # docker
    chromium
    #google-chrome
    kitty
    krita
    #marker
    #jdk
    uwufetch
    v2ray
    #vitetris
    neofetch
    #pfetch
    qv2ray
    tdesktop
    #viu
    vlc
    steam-run
    #arch-install-scripts
    #pacman
    #gnome.gnome-terminal
    #gnome.gnome-tweaks
    vscode
    #osu-lazer
    minecraft
    #nyancat
    #nmap
    screenfetch
    gcc
    viu
    #gnome-builder
    #gnome.gedit
    #gnome.gnome-screenshot
    scrcpy
    #glade
    #yandex-browser    
    git
    alacritty
    #gnomeExtensions.toggle-alacritty
    #rose-pine-gtk-theme
    unzip
    unrar
    nmap
    p7zip
    flameshot
    inkscape
    nur.repos.xddxdd.wechat-uos-bin
    #nur.repos.linyinfeng.wemeet
    nur.repos.linyinfeng.icalingua-plus-plus
    #python310Packages.pycairo
    #python310Packages.pygobject3
    #python310Packages.pysimplegui
    python310
    gtk3
    mpv
    vala
    polybar
    libsForQt5.kmines
    #materia-theme
    #materia-kde-theme
    #arc-kde-theme
    #adapta-kde-theme
    #material-icons
    #material-design-icons
    libsForQt5.yakuake
    #guake
    papirus-icon-theme
    #latte-dock
    libsForQt5.ark
    #netease-music-tui
    #adapta-gtk-theme
    #adapta-backgrounds
    netease-cloud-music-gtk
    #screenfetch
    gimp
    #p7zip
    apfs-fuse
    #neovim
    lmms
    #neovim-qt
    tmux
    htop
    gparted
    #marker
    libsForQt5.kate
    wine-staging
    etcher
    pciutils
    #gnomeExtensions.x11-gestures
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable zsh
  programs.zsh.enable = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    #plugins = [ "git" "sudo" "docker" "kubectl" ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

