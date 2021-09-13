{ buildGoModule, fetchFromGitHub, lib, makeWrapper, xdotool, xkb-switch }:

buildGoModule {
  pname = "wmtools";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "wmtools";
    rev = "f8c43f8453891b00c1aff3793473b0911de39300";
    sha256 = "0mc1hqai3k3qaa7ys7g7fv247699mmrar261fyazhkc6pf6rczv7";
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
