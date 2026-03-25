{
  config,
  pkgs,
  ...
}:

{
  networking.firewall.trustedInterfaces = [
    "virbr0"
    "Meta"
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
