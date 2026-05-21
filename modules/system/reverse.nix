{pkgs, config, ...}:
{
  sops.secrets.ovh = {
      sopsFile = ../../hosts/tiramisu/ovh.env;
      format = "dotenv";

      owner = "root";
      mode = "0400";
  };

  # TODO : fix with https://github.com/acmesh-official/acme.sh/wiki/How-to-use-OVH-domain-api
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "joachimlf@redgl0w.net";
      dnsProvider = "ovh";
      environmentFile = config.sops.secrets.ovh.path; 
    };
    certs."le-fournis.fr" = {
      domain = "*.le-fournis.fr";
      group = "caddy";
    };
  };

  services.caddy = {
    enable = true;
  };
}

