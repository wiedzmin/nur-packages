{ buildGoModule, fetchFromGitHub, lib, makeWrapper, xkb-switch }:

buildGoModule {
  pname = "wmtools";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "wmtools";
    rev = "ab17f2da8c70313c31cf340f6cae966955f09134";
    sha256 = "1j2a823lcsjax314x7k7z1ya2mb4qh5yihsg693x2iqj0dfpz96m";
  };

  vendorSha256 = "Bbwm0yqB2SamZewdSuAOFLcuhZiFgW2y0i2I6UlOStg=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/i3-kbd --prefix PATH : ${lib.makeBinPath [ xkb-switch ]}
  '';

  meta = with lib; {
    description = "Various helper tools for window managers";
    homepage = "https://github.com/wiedzmin/wmtools";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
