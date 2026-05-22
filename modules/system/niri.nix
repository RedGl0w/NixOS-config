{pkgs, ...}:
{
  programs.niri.enable = true;

  # File picker
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];

    config.common = {
      default = "*";
      "org.freedesktop.impl.portal.FileChooser" = "gtk";
    };
  };
  environment.systemPackages = with pkgs; [
    gsettings-desktop-schemas
    gtk3
  ];


  programs.dconf.enable = true;
	services.dbus.enable = true;

  services.libinput.enable = true;
}
