{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];

  networking.firewall.trustedInterfaces = [
    "virbr0"
  ];

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;

    docker.enable = true;
  };
}
