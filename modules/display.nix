{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  environment = {
    variables = {
      TERMINAL = "ghostty";

      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";

      ELECTRON_OZONE_PLATFORM_HINT = "auto";

      _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    systemPackages = with pkgs; [
      adw-gtk3
      papirus-icon-theme
      gnome-text-editor
      nautilus-python
      nautilus
    ];
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime
      ];
      settings.inputMethod = {
        "Groups/0" = {
          "Name" = "Default";
          "Default Layout" = "us";
          "DefaultIM" = "rime";
        };
        "Groups/0/Items/0" = {
          "Name" = "rime";
          "Layout" = "";
        };
        "GroupOrder" = {
          "0" = "Default";
        };
      };
      waylandFrontend = true;
    };
  };

  programs = {
    dms-shell = {
      enable = true;
      quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    };

    virt-manager.enable = true;

    dsearch.enable = true;

    niri.enable = true;
  };

  services = {
    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    };

    udisks2.enable = true;

    devmon.enable = true;

    gvfs.enable = true;
  };
}
