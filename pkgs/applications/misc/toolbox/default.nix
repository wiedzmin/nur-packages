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
    rev = "0f5770255de4df19cba476875eb568a2e4205d6e";
    sha256 = "15vakb9y05nz53lk35g46qfwl5i6962qc97skzkvlcv1890xn7dr";
  };

  vendorSha256 = "rj2FcczxI+v+UDEywXcz5H3D8hWAW7zCMTv4KCSL154=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ xsel ]}
    wrapProgram $out/bin/websearch --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
