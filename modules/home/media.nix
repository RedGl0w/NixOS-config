{pkgs, ...}:
{
  home.packages = with pkgs; [
    # Document creation
    typst
    font-awesome

    libreoffice
    hunspell
    
    # TODO latex too


    # Reader
    glow
    eog
    zotero
    zathura

    # Music and score
    musescore
    reaper
    ardour
    carla
    sfizz

    # Video
    vlc
    ffmpeg-full

    # Image
    gimp
    darktable
  ];
}
