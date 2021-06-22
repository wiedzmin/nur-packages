{ buildGoModule, dmenu-ng, fd, fetchFromGitHub, git, lib, makeWrapper, networkmanager, rofi, xsel }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "ccfb43a5a463c96279ec42287f0e53216dcb9c55";
    sha256 = "11lypw8yvzpq5gzkmnmkgydymxlg5nm6i1cdiz252py253m9janh";
  };

  vendorSha256 = "l9wpCKMurTEjwD954kMeV6FR7Qhe25i77ouXuxTneZw=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/bookshelf --prefix PATH : ${lib.makeBinPath [ rofi ]}
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
    wrapProgram $out/bin/projects --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng fd ]}
    wrapProgram $out/bin/qbsessions --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng ]}
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ xsel ]}
    wrapProgram $out/bin/websearch --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
