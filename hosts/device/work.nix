{
  config,
  pkgs,
  ...
}:

{
  hardware = {
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
      ];
    };

    cpu.intel.updateMicrocode = true;
  };
}
