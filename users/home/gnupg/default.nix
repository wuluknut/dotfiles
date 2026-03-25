{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.file = {
    ".gnupg/import/gpg_private_keys.asc" = {
      source = config.lib.file.mkOutOfStoreSymlink osConfig.sops.secrets."gpg_private_keys".path;
    };
    ".gnupg/import/gpg_public_keys.asc" = {
      source = ./gpg_public_keys.asc;
    };
  };

  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        trust = "ultimate";
        source = ./gpg_public_keys.asc;
      }
    ];
    settings.keyserver = "keys.openpgp.org";
  };
}
