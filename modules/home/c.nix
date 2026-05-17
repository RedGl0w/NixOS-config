{pkgs, ...}:
{
  home.packages = with pkgs; [
    # Compilers
    gcc
    emscripten

    # Debug/reverse
    gdb
    valgrind
    ghidra

    # Build systems
    cmake
    gnumake
    automake
    autoconf

    # Packages
    pkg-config    
    sfml_2
    SDL2.dev
    freetype

    # Other
    man-pages
    man-pages-posix
  ];
}
