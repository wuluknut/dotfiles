{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  imports = [
    ../home/chromium
    ../home/codex
    ../home/ghostty
    ../home/jetbrains
    ../home/niri
    ../home/vscode
    ../home/wallpaper
  ];

  home = {
    username = "wkwork";
    homeDirectory = "/home/wkwork";
    stateVersion = "26.05";

    file = {
      ".ssh/id_ed25519" = {
        source = config.lib.file.mkOutOfStoreSymlink osConfig.sops.secrets."ssh/wkwork".path;
      };
    };
  };

  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Wulu Knut";
          email = "wuluknut@qq.com";
        };
        safe.directory = "*";
      };
    };

    home-manager.enable = true;
  };
}
