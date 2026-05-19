{pkgs, ...}:
{
  programs.firefox = {
    enable = true;

    languagePacks = [ "fr" ];

    profiles.default.settings = {
      "browser.startup.page" = 3; # Restore previous session
      "browser.startup.homepage" = "google.com"; # TODO Change that to NAS homepage
    };

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
    };

    # TODO set ExtensionSettings here too
  };
}

