{config, ...}:
{
  sops.secrets."nextcloud/root-password" = {
    owner = "root";
    mode = "0400";
  };
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    config.adminpassFile = config.sops.secrets."nextcloud/root-password".path;
    config.dbtype = "sqlite";

    # Temporary solution
    settings.trusted_domains = [ "192.168.88.240" "tiramisu.local" "nextcloud.le-fournis.fr" ];

    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks mail;
    };
    extraAppsEnable = true;

    home = "/nextcloud";
  };

  services.nginx.virtualHosts."${config.services.nextcloud.hostName}".listen = [ { addr = "127.0.0.1"; port = 8080; } ];

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.enable = true;

  services.caddy.virtualHosts."nextcloud.le-fournis.fr" = {
    useACMEHost = "le-fournis.fr";
    extraConfig = ''
      reverse_proxy 127.0.0.1:8080
    '';
  };
}

