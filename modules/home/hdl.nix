{pkgs, ...}:
{
  home.packages = with pkgs; [
    yosys
    nextpnr
    trellis
    verilator
    icesprog
  ];
}
