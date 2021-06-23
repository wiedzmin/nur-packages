{ buildGoModule, dmenu-ng, fd, fetchFromGitHub, git, lib, makeWrapper, networkmanager, rofi, tmux, xsel }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "beccba8bfdd29369dd5cd0e839c4f0b190926fa3";
    sha256 = "12rqgw98r1z5hx0r9wib9divl0pqq55x7spjxg7ksw5icp1ckg1y";
  };

  vendorSha256 = "l9wpCKMurTEjwD954kMeV6FR7Qhe25i77ouXuxTneZw=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/bookshelf --prefix PATH : ${lib.makeBinPath [ rofi ]}
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
    wrapProgram $out/bin/projects --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng fd ]}
    wrapProgram $out/bin/qbsessions --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng ]}
    wrapProgram $out/bin/services --prefix PATH : ${lib.makeBinPath [ rofi tmux ]}
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
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
