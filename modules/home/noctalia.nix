{...}:
{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "default";
        position = "right";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "WiFi";
            }
            {
              id = "VPN";
            }
            {
              id = "Bluetooth";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 20;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };

      dock = {
        enabled = false;
      };

      colorSchemes.predefinedScheme = "Monochrome";
      location = {
        monthBeforeDay = true;
        name = "Rennes, France";
      };
    };
  };
}
