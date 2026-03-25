{
  config,
  pkgs,
  ...
}:

{
  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = config.sops.secrets."proxy/mihomo".path;
    webui = pkgs.metacubexd;
  };
}
