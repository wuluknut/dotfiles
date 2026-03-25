{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nodejs_22
    pnpm
  ];

  programs.codex.enable = true;
}
