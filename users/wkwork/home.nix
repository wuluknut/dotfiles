{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  imports = [
    ../home/chromium
    ../home/develop
    ../home/niri
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
