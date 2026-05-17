{pkgs, ...}:
{
  networking.networkmanager.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    trippy
    ipcalc
    wireguard-tools
    networkmanagerapplet
    iftop
    wireshark
  ];
}
