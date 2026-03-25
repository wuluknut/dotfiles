{ ... }:

{
  additions = final: prev: import ../pkgs final;

  modifications = final: prev: {
    fcitx5-rime = prev.fcitx5-rime.override {
      rimeDataPkgs = [
        final.oh-my-rime
      ];
    };
  };
}
