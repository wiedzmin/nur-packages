{ lib
, buildGoModule
, dmenu-ng
, fetchFromGitHub
, git
, makeWrapper
, networkmanager
, xsel
}:
buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "8677bfd17746be3bbdd1f782e09029d14d328242";
    sha256 = "0kg90bbcxqd9pzqy8qf3w83xzxqym8w0fkdym8n0ikn4l8iq79m1";
  };

  vendorSha256 = "+n1vapvcbyRVXQRMk7fGE7fSPZmmI9ubqhSIlOxbez0=";

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ xsel ]}
    wrapProgram $out/bin/websearch --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
