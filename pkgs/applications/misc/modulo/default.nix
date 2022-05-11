{ appimageTools, lib, fetchurl }:
let
  pname = "modulo";
  version = "0.1.1";
  src = fetchurl {
    url = "https://github.com/federico-terzi/modulo/releases/download/v${version}/modulo-x86_64.AppImage";
    name = "${pname}-${version}.AppImage";
    sha256 = "117cagp2yi32fk6h90s6xvsc3a8jcfpj0w98632j3gg5nb0ffpx2";
  };

  appimageContents = appimageTools.extract {
    name = "${pname}-${version}";
    inherit src;
  };
in appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: with pkgs; [ ];

  extraInstallCommands = ''
    mv $out/bin/${pname}-${version} $out/bin/${pname}

    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/icon.svg $out/share
  '';
  # wrapType2 does not passthru pname+version
  passthru.version = version;

  meta = with lib; {
    description = "Basic Cross-platform GUI Toolkit for Any Language ";
    homepage = "https://github.com/federico-terzi/modulo";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
