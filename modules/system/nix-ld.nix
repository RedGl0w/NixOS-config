{pkgs, ...}:
{
  programs.nix-ld = {
    enable = true;
    libraries = (
      with pkgs; [
        expat
        nss
    		nspr
				mesa
				libgbm	
    		atk
    		at-spi2-atk
    		cups
    		dbus
    		gtk3
    		libdrm
    		mesa
    		pango
    		cairo
    		glib
				libxkbcommon
				alsa-lib
				gsettings-desktop-schemas

				xorg.libX11
    		xorg.libXcomposite
    		xorg.libXcursor
    		xorg.libXdamage
    		xorg.libXext
    		xorg.libXfixes
    		xorg.libXi
    		xorg.libXrandr
    		xorg.libXrender
    		xorg.libXScrnSaver
    		xorg.libXtst
				xorg.libxcb
      ]
    );
  };
}
