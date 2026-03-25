{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.file = {
    "Pictures/Wallpapers/wallpaper-001.jpg" = {
      source = ./wallpaper-001.jpg;
    };
    "Pictures/Wallpapers/wallpaper-002.jpg" = {
      source = ./wallpaper-002.jpg;
    };
  };
}
