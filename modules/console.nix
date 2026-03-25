{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    zip
    unzip
    dnsmasq
    fastfetch
    nixfmt
    wget
  ];

  virtualisation = {
    docker.enable = true;

    libvirtd.enable = true;
  };

  programs = {
    fish = {
      enable = true;
      shellInit = "set -g fish_greeting";
      interactiveShellInit = ''
        if test "$TERM" = "linux"
          set -gx LANG en_US.UTF-8
        end
      '';
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break = {
          disabled = false;
        };
        palette = "catppuccin_latte";
      };
      presets = [
        "catppuccin-powerline"
      ];
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    yazi.enable = true;
  };
}
