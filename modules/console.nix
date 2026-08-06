{
  config,
  pkgs,
  ...
}:

{
  environment = {
    shellAliases = {
      nf = "sudo nix flake update";
      nb = "sudo nixos-rebuild boot --flake .#nixos";
      ns = "sudo nixos-rebuild switch --flake .#nixos";
      ng = "sudo nix-collect-garbage -d";
    };

    systemPackages = with pkgs; [
      zip
      unzip
      fastfetch
      nixfmt
      wget
    ];
  };

  programs = {
    nix-ld.enable = true;

    fish = {
      enable = true;
      shellInit = "set -g fish_greeting";
      interactiveShellInit = ''
        if test "$TERM" = "linux"
          set -gx LANG en_US.UTF-8
        end

        function yz
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          command yazi $argv --cwd-file="$tmp"
          if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
          end
          command rm -f -- "$tmp"
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
