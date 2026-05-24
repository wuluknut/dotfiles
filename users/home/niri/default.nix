{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.file = {
    ".config/niri/config.kdl" = {
      source = ./config.kdl;
    };

    "Pictures/Wallpapers/wallpaper-001.jpg" = {
      source = ./wallpaper/wallpaper-001.jpg;
    };
    "Pictures/Wallpapers/wallpaper-002.jpg" = {
      source = ./wallpaper/wallpaper-002.jpg;
    };
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dankcolors";
      window-decoration = false;
      window-padding-balance = true;
      window-padding-x = 6;
      window-padding-y = 6;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

}
