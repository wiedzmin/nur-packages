{ buildGoModule, fetchFromGitHub, lib, makeWrapper, xkb-switch }:

buildGoModule {
  pname = "i3tools";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "i3tools";
    rev = "9d40fbe8dc854194a206612053fc4848b9b4ac4e";
    sha256 = "1xxzrk55lk03cnjnl4dwz53n4673asnlnd98cjg1l6jmcjm1rd98";
  };

  vendorSha256 = "e57lbiimXVasnCLndQ70pZpIJXYI0y5OqpcnpmsOfeI=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/kbd --prefix PATH : ${lib.makeBinPath [ xkb-switch ]}
  '';

  meta = with lib; {
    description = "Various helper tools for i3";
    homepage = "https://github.com/wiedzmin/i3tools";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
