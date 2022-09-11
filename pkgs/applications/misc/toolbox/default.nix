{ buildGoModule, fd, fetchFromGitHub, git, lib, makeWrapper, networkmanager, rofi, tmux, tmuxp, xkb-switch, xsel }:

buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "6234cb62e6da4985a8bea80ce8c3505fd3375797";
    sha256 = "072wzj4860salkdl8vi605pb4fwv2ivijpmrfc1p527n8w0jv25n";
  };

  vendorSha256 = "+/uvr/axULGBuc/Awk3BZxxCndQehbvIjmfwTg9bYhs=";
  # vendorSha256 = lib.fakeSha256; # because of active development

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/links --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
    wrapProgram $out/bin/projects --prefix PATH : ${lib.makeBinPath [ fd rofi xkb-switch ]}
    wrapProgram $out/bin/qbsessions --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch ]}
    wrapProgram $out/bin/services --prefix PATH : ${lib.makeBinPath [ rofi tmux xkb-switch ]}
    wrapProgram $out/bin/tmuxctl --prefix PATH : ${lib.makeBinPath [ rofi tmuxp xkb-switch ]}
    wrapProgram $out/bin/webjumps --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
    wrapProgram $out/bin/websearch --prefix PATH : ${lib.makeBinPath [ rofi xkb-switch xsel ]}
  '';

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
