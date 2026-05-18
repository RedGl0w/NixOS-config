{config, ...}:
{
  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";

    # Temporary solution
    settings.trusted_domains = [ "192.168.88.240" "tiramisu.local" ];

    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks mail;
    };
    extraAppsEnable = true;
  };

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.enable = true;
}

