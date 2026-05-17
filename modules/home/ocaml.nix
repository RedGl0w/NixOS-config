{pkgs, ...}:
{
  home.packages = with pkgs; [
    ocaml
    opam
    ocamlPackages.utop
    ocamlPackages.lsp
  ];
}
