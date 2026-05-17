{pkgs, ...}:
{
  programs.gnome.extensions = {
    enable = true;
    extensions = {
      "user-theme@gnome-shell-extensions.gcampax.github.com" = pkgs.gnomeExtensions.user-themes;
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
  ];
}
