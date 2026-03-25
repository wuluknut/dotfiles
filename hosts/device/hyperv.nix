{
  config,
  pkgs,
  ...
}:

{
  services.fstrim.enable = true;

  virtualisation.hypervGuest.enable = true;
}
