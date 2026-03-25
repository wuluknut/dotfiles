{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.disko.nixosModules.disko

    # ./device/hyperv.nix
    # ./disko/hyperv.nix

    ./device/work.nix
    ./disko/work.nix

    ./hardware.nix
  ];

  boot = {
    loader = {
      limine = {
        enable = true;
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      systemd = {
        enable = true;
        tpm2.enable = true;
      };

      availableKernelModules = [
        "tpm_crb"
        "tpm_tis"
      ];

      luks.devices."crypted".crypttabExtraOpts = [
        "tpm2-device=auto"
      ];
    };

    tmp.cleanOnBoot = true;
  };

  hardware = {
    graphics.enable = true;

    enableRedistributableFirmware = true;
  };

  zramSwap.enable = true;

  networking.networkmanager.enable = true;

  services.journald.extraConfig = "MaxRetentionSec=7day";

  time.timeZone = "Asia/Shanghai";

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
    ];
  };

  console = {
    keyMap = "us";
  };

  system.stateVersion = "26.05";
}
