{pkgs, ...}:
{
  programs.niri.enable = true;

  # File picker
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal-wlr
  #   ];

  #   config.common = {
  #     default = "*";
  #     "org.freedesktop.impl.portal.FileChooser" = "gtk";
  #   };
  # };
  services.libinput.enable = true;
}
