{
  config,
  osConfig,
  pkgs,
  ...
}:

{
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
}
