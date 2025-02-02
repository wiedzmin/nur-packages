{ buildGoModule, fd, fetchFromGitHub, git, lib, makeWrapper, mc, networkmanager, rofi, systemd, tmux, tmuxp, xkb-switch, xsel, yad }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "bdeecb686d36efc52652afb126ade66ebae1ab33";
    sha256 = "0lf8mxxxpwdq5bwp82hcm2mflcp3lydcyj2byqq22pnl432al44n";
  };

  vendorHash = "sha256-+/uvr/axULGBuc/Awk3BZxxCndQehbvIjmfwTg9bYhs=";
  # vendorHash = lib.fakeSha256; # because of active development

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
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
