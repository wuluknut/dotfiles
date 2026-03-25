{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    jetbrains.idea

    gradle
    maven
  ];

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin-17;
  };
}
