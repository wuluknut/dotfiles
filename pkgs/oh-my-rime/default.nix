{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "oh-my-rime";

  version = "2026.03.03";

  src = fetchFromGitHub {
    owner = "Mintimate";
    repo = "oh-my-rime";
    rev = "cf1a4083236b57a5f49a69e0bba254078e99b79b";
    sha256 = "sha256-FzxHMdVENeHkY8INGoRPFbO8lu3UWCQmCGhhro2xxIA=";
  };

  postPatch = ''
    substituteInPlace lua/auxCode_filter.lua --replace 'rime_api.get_user_data_dir() .. "/lua/aux_code/"' "\"$out/share/rime-data/lua/aux_code/\""
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/rime-data
    cp -rvL * $out/share/rime-data/

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Mintimate/oh-my-rime";
    description = "The Simple Config Template Of Rime By Mintimate.";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
