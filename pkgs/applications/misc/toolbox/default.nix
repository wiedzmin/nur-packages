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
    rev = "0b15206600966a437d5a25efa875887f7898a217";
    sha256 = "0r0fcdz05crpd39xfz66ndnkkrskjdin3fn9028sc5pgdrg2iqjw";
  };

  vendorSha256 = "fx/qmxv32s4I4ntpqV12VJnrMVEGxr2S8m9s7jc8h+Y=";
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
