{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Languages support
        ms-vscode.cpptools-extension-pack # C/C++
        ms-vscode.cpptools # C/C++
        ms-python.python # python
        ocamllabs.ocaml-platform # OCaml
        bbenoist.nix # Nix
        mshr-h.veriloghdl # VHDL/verilog
        zhwu95.riscv # ASM RISC-V
        ms-vscode.makefile-tools # Makefile
        myriad-dreamin.tinymist # Typst

        # Theme
        # No monokai yet on nix :'( (we could add it with extensionsFromVscodeMarketplace)

        # QoL
        eamodio.gitlens # blame
        alefragnani.bookmarks # bookmarks

        # Other
        tomoki1207.pdf

      ];

      userSettings = {
        "editor.tabSize" = 2;
	"editor.formatOnSave" = false;
        #"editor.formatOnSave" = true;
        "editor.fontLigatures" = true;
      };
    };
  };

  stylix.targets.vscode.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

