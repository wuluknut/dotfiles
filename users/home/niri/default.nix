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
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
