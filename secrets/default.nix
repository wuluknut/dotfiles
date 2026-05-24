{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.sops.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/var/lib/sops-nix/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      "passwd/root".neededForUsers = true;
      "passwd/wkwork".neededForUsers = true;
      "passwd/wuluknut".neededForUsers = true;

      "ssh/wkwork" = {
        owner = "wkwork";
        mode = "0600";
      };

      "ssh/wuluknut" = {
        owner = "wuluknut";
        mode = "0600";
      };

      "gpg_private_keys" = {
        owner = "wuluknut";
        mode = "0600";
      };
    };
  };
}
