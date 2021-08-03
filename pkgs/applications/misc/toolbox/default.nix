{ buildGoModule, dmenu-ng, fd, fetchFromGitHub, git, lib, makeWrapper, networkmanager, rofi, tmux, xsel }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "fa7e3018dabc9670ebd2868bb220b08c35e73de1";
    sha256 = "1wkrf80nvm499vg5dmik1rarwi5fxkqnjlx5vdb6pvvh56zqmxxl";
  };

  vendorSha256 = "e4ZQc8Mrgx1V5syAqjbWmg6zEvNX555zywF6tzLgWHk=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/bookshelf --prefix PATH : ${lib.makeBinPath [ rofi ]}
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ dmenu-ng xsel ]}
    wrapProgram $out/bin/projects --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng fd ]}
    wrapProgram $out/bin/qbsessions --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng ]}
    wrapProgram $out/bin/services --prefix PATH : ${lib.makeBinPath [ dmenu-ng rofi tmux ]}
    wrapProgram $out/bin/vpn --prefix PATH : ${lib.makeBinPath [ rofi dmenu-ng ]}
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
