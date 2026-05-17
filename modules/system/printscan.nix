{pkgs, ...}:
{
  services.printing.enable = true;
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];

  environment.systemPackages = with pkgs; [
    simple-scan
  ];
}
