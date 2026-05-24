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
    ../home/gnupg
    ../home/niri
  ];

  home = {
    username = "wuluknut";
    homeDirectory = "/home/wuluknut";
    stateVersion = "26.05";

    file = {
      ".ssh/id_ed25519" = {
        source = config.lib.file.mkOutOfStoreSymlink osConfig.sops.secrets."ssh/wuluknut".path;
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
          email = "wuluknut@email.com";
        };
        safe.directory = "*";
      };
      signing = {
        key = "42498C3257195E02";
        format = "openpgp";
        signByDefault = true;
      };
    };

    home-manager.enable = true;
  };
}
