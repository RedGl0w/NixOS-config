{
  config,
  inputs,
  pkgs,
  ...
}:
{
  programs.niri = {
    package = pkgs.niri;
    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = "fr";
          };
        };
        mouse = {
	        accel-speed = 1.0;
	      };
      };
    
      # TODO binds
      binds =
        with config.lib.niri.actions;
        let
          sh = spawn "sh" "-c";
        in
        {
          "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
          "Mod+D".action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
          "Mod+L".action = spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";

          # Helpers
          "Mod+Colon".action = show-hotkey-overlay;
          "Mod+O".action = toggle-overview;

          # Window manipulation
          "Mod+Q".action = close-window;
          "Mod+F".action = maximize-column;
          "Mod+Space".action = toggle-window-floating;

          # Media (screen, backlight, volume, music, ...)
          "Mod+S".action.screenshot = [ ];
          "XF86MonBrightnessUp".action = sh "brightnessctl set 10%+";
          "XF86MonBrightnessDown".action = sh "brightnessctl set 10%-";
          "XF86AudioRaiseVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          "XF86AudioLowerVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioPlay".action = sh "playerctl" "play-pause";
          "XF86AudioPrev".action = sh "playerctl" "previous";
          "XF86AudioNext".action = sh "playerctl" "next";

          # Other
          "Mod+E".action = spawn "noctalia-shell" "ipc" "call" "launcher" "emoji";

          "Mod+Ampersand".action.focus-workspace = 1;
          "Mod+Eacute".action.focus-workspace = 2;
          "Mod+Quotedbl".action.focus-workspace = 3;
          "Mod+Apostrophe".action.focus-workspace = 4;
          "Mod+Parenleft".action.focus-workspace = 5;
          "Mod+Minus".action.focus-workspace = 6;
          "Mod+Egrave".action.focus-workspace = 7;
          "Mod+Underscore".action.focus-workspace = 8;
          "Mod+Ccedilla".action.focus-workspace = 9;

          "Mod+Shift+Ampersand".action.move-column-to-workspace = 1;
          "Mod+Shift+Eacute".action.move-column-to-workspace = 2;
          "Mod+Shift+Quotedbl".action.move-column-to-workspace = 3;
          "Mod+Shift+Apostrophe".action.move-column-to-workspace = 4;
          "Mod+Shift+Parenleft".action.move-column-to-workspace = 5;
          "Mod+Shift+Minus".action.move-column-to-workspace = 6;
          "Mod+Shift+Egrave".action.move-column-to-workspace = 7;
          "Mod+Shift+Underscore".action.move-column-to-workspace = 8;
          "Mod+Shift+Ccedilla".action.move-column-to-workspace = 9;

          "Mod+Left".action.move-column-left = [ ];
          "Mod+Right".action.move-column-right = [ ];
          "Mod+Up".action.move-window-up = [ ];
          "Mod+Down".action.move-window-down = [ ];

          # TODO : keybinds for workspace navigation :p
        };
      
      spawn-at-startup = [
        # TODO : make gnome keyring work
        {
          command = [ "noctalia-shell" ];
        }
      ];

      window-rules = [
        {
	        geometry-corner-radius = {
            bottom-left = 5.;
	          bottom-right = 5.;
            top-left = 5.;
            top-right = 5.;
	        };
	        clip-to-geometry = true;
        }
      ];
      debug = {
        honor-xdg-activation-with-invalid-serial = [];
      };
      layer-rules = [
	      {
	        matches = [
	          {
	            namespace = "^noctalia-wallpaper*";
	          }
	        ];
	        place-within-backdrop = true;
	      }
      ];
      layout.background-color = "transparent";
      overview.workspace-shadow.enable = false;
    };
  };

  services.dunst.enable = true; # Notifs
  services.gnome-keyring.enable = false;

  home.packages = with pkgs; [
    xwayland-satellite
    kitty
    brightnessctl
  ];
}
