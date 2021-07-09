{ buildGoModule, fetchFromGitHub, lib, makeWrapper, xkb-switch }:

buildGoModule {
  pname = "wmtools";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "wmtools";
    rev = "be00b29908345b3b4240ef4d8adc88efbc0909b6";
    sha256 = "0v3p7x8kpbkf2qsi1l0k7k2j2agxj9fw593hi6ncjfqd785h9xld";
  };

  vendorSha256 = "REJ2PMk+FV9AXUtjEvOJyDQlelYP+i9X5YCsvQ4sO6Q=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/kbd --prefix PATH : ${lib.makeBinPath [ xkb-switch ]}
  '';

  meta = with lib; {
    description = "Various helper tools for window managers";
    homepage = "https://github.com/wiedzmin/wmtools";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
