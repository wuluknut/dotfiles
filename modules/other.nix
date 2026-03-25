{
  config,
  pkgs,
  ...
}:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services = {
    blueman.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      wireplumber.enable = true;
    };

    printing.enable = true;

    upower.enable = true;
  };

  security.rtkit.enable = true;
}
