{
  config,
  pkgs,
  ...
}:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      wqy_zenhei
      wqy_microhei
      sarasa-gothic

      nerd-fonts.meslo-lg
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono

      font-awesome
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [
          "Noto Color Emoji"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Symbols Nerd Font"
          "Sarasa Term SC"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
