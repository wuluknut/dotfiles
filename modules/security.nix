{
  config,
  pkgs,
  ...
}:

{
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 2999;
      to = 4999;
    }
    {
      from = 7999;
      to = 9999;
    }
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    samba = {
      enable = true;
      openFirewall = true;
      nmbd.enable = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "Samba Server %v";
          "security" = "user";

          "server max protocol" = "SMB3";
          "server min protocol" = "NT1";

          "ntlm auth" = "ntlmv1-permitted";

          "disable netbios" = "no";

          "hosts deny" = "0.0.0.0/0";
          "hosts allow" = "192.168.";

          "guest account" = "nobody";
          "map to guest" = "Bad User";

          "log file" = "/var/log/samba/log.%m";
          "max log size" = "50";
        };

        Public = {
          "path" = "/srv/samba/public";

          "writable" = "yes";
          "browseable" = "yes";
          "read only" = "no";

          "guest ok" = "yes";
          "guest only" = "yes";

          "force user" = "nobody";

          "create mask" = "0666";
          "directory mask" = "0777";
        };
      };
    };

    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

  systemd.tmpfiles.rules = [
    "d /srv/samba 0755 root root -"
    "d /srv/samba/public 0777 nobody nogroup -"
  ];
}
