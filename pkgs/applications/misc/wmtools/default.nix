{ buildGoModule, fetchFromGitHub, lib, makeWrapper, xdotool, xkb-switch }:

buildGoModule {
  pname = "wmtools";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "wmtools";
    rev = "fb3dfb5a0e675138f770c12f590afc23d7f3dbc0";
    sha256 = "1fkmz0drd1qsm507qff00a63ckhg5a7fh53fn5jawfshgsjr5dxd";
  };

  vendorSha256 = "Bbwm0yqB2SamZewdSuAOFLcuhZiFgW2y0i2I6UlOStg=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/i3-kbd --prefix PATH : ${lib.makeBinPath [ xkb-switch ]}
    wrapProgram $out/bin/i3-mousewarp --prefix PATH : ${lib.makeBinPath [ xdotool ]}
  '';

  meta = with lib; {
    description = "Various helper tools for window managers";
    homepage = "https://github.com/wiedzmin/wmtools";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
