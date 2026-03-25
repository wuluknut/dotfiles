{
  config,
  osConfig,
  pkgs,
  ...
}:

{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "dhdgffkkebhmkfjojejmpbldmpobfkfo"; } # Tampermonkey
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
    ];
  };
}
