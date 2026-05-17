{pkgs, ...}:
{
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "fr";
  services.libinput.enable = true;

  programs.dconf.enable = true;
}
