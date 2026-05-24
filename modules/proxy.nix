{
  config,
  pkgs,
  ...
}:

{
  networking = {
    firewall = {
      trustedInterfaces = [
        "Mihomo"
      ];

      allowedTCPPorts = [
        7890
      ];
      allowedUDPPorts = [
        7890
      ];

      checkReversePath = "loose";
    };
  };

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
  };
}
