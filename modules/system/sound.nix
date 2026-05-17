{pkgs, ...}:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pipewire.jack
    coppwr
  ];
}
