{ lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, extra-cmake-modules
, dbus
, libX11
, libXi
, libXtst
, libnotify
, openssl
, xclip
, xdotool
, makeWrapper
, libxkbcommon
, wxGTK31
}:

rustPlatform.buildRustPackage rec {
  pname = "espanso";
  version = "2.1.8";

  src = fetchFromGitHub {
    owner = "espanso";
    repo = pname;
    rev = "v${version}";
    sha256 = "06wzrjdvssixgd9rnrv4cscbfiyvp5pjpnrih48r0ral3pj2hdg5";
  };

  cargoSha256 = "sha256-U2ccF7DM16TtX3Kc4w4iNV4WsswHJ0FpO3+sWCL1Li8=";
  # cargoSha256 = lib.fakeSha256;

  nativeBuildInputs = [
    extra-cmake-modules
    pkg-config
    makeWrapper
  ];

  buildInputs = [
    dbus
    libxkbcommon
    wxGTK31
    libX11
    libXtst
    libXi
    libnotify
    xclip
    openssl
    xdotool
  ];

  # Some tests require networking
  doCheck = false;

  preBuild = ''
    export PATH="${wxGTK31}/bin:$PATH"
  '';

  postInstall = ''
    wrapProgram $out/bin/espanso \
      --prefix PATH : ${lib.makeBinPath [ libnotify xclip ]}
  '';

  meta = with lib; {
    description = "Cross-platform Text Expander written in Rust";
    homepage = "https://espanso.org";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ wiedzmin ];
    platforms = platforms.unix;

    longDescription = ''
      Espanso detects when you type a keyword and replaces it while you're typing.
    '';
  };
}
