{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  defaultUserConfig = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "libvirtd"
      "greeter"
      "uucp"
      "i2c"
    ];
  };
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users = {
      wkwork = ./wkwork/home.nix;

      wuluknut = ./wuluknut/home.nix;
    };
  };

  users = {
    mutableUsers = false;

    defaultUserShell = pkgs.fish;

    users = {
      root = {
        hashedPasswordFile = config.sops.secrets."passwd/root".path;
      };

      wkwork = lib.recursiveUpdate defaultUserConfig {
        hashedPasswordFile = config.sops.secrets."passwd/wkwork".path;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINg7NeetoatlNlYd3NmktyEypalByoiWneXev+FmYS/S wuluknut@qq.com"
        ];
      };

      wuluknut = lib.recursiveUpdate defaultUserConfig {
        hashedPasswordFile = config.sops.secrets."passwd/wuluknut".path;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1y2R+76nCH5TU1XhMn63u/iQ3X/j7Imbii7RonX/y2 wuluknut@gmail.com"
        ];
      };
    };
  };
}
