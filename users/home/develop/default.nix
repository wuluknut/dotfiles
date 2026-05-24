{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    jetbrains.idea

    python3

    gradle
    maven

    nodejs_22
    pnpm
  ];

  programs = {
    claude-code.enable = true;

    vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          ms-python.black-formatter
          catppuccin.catppuccin-vsc-icons
          ms-ceintl.vscode-language-pack-zh-hans
          streetsidesoftware.code-spell-checker
          editorconfig.editorconfig
          usernamehw.errorlens
          dbaeumer.vscode-eslint
          jnoortheen.nix-ide
          esbenp.prettier-vscode
          ms-python.python
          vue.volar
        ];
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
      };
    };

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };
  };
}
