{ buildGoModule, fd, fetchFromGitHub, git, lib, makeWrapper, mc, networkmanager, rofi, systemd, tmux, tmuxp, xkb-switch, xsel, yad }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "8899137684099371b1b35afadbb7a2b2bec4ec50";
    sha256 = "0f2j95760cpy2nx7yk03ldgv1qr7cf5a86nan8m2nh70kyz6fw90";
  };

  vendorHash = "sha256-3PBwW46m150QcXtHTk/TsKqwZb/0g7cVOCjDeRDRzPE=";
  # vendorHash = lib.fakeHash; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  # TODO: review wrappers
  postInstall = ''
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
    wrapProgram $out/bin/projects --prefix PATH : ${lib.makeBinPath [ fd rofi xkb-switch ]}
    wrapProgram $out/bin/qbsessions --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch ]}
    wrapProgram $out/bin/services --prefix PATH : ${lib.makeBinPath [ rofi systemd tmux xkb-switch ]}
    wrapProgram $out/bin/tmuxctl --prefix PATH : ${lib.makeBinPath [ rofi tmuxp xkb-switch ]}
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
    wrapProgram $out/bin/websearch --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
    wrapProgram $out/bin/wmkb --prefix PATH : ${lib.makeBinPath [ yad ]}
    wrapProgram $out/bin/mcpanes --prefix PATH : ${lib.makeBinPath [ mc ]}
    wrapProgram $out/bin/qbcli --prefix PATH : ${lib.makeBinPath [ xkb-switch ]}
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
