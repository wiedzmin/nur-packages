{ fetchurl, lib, libX11, libXft, libXinerama, patches ? [ ./xim.patch ./dmenu-layout-switching.patch ], stdenv, zlib }:

stdenv.mkDerivation rec {
  name = "dmenu-ng-4.9";

  src = fetchurl {
    url = "https://dl.suckless.org/tools/${name}.tar.gz";
    sha256 = "0ia9nqr83bv6x247q30bal0v42chcj9qcjgv59xs6xj46m7iz5xk";
  };

  buildInputs = [ libX11 libXinerama zlib libXft ];

  inherit patches;

  postPatch = ''
    sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
    sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
  '';

  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';

  makeFlags = [ "CC:=$(CC)" ];

  meta = with lib; {
      description = "A generic, highly customizable, and efficient menu for the X Window System";
      homepage = "https://tools.suckless.org/dmenu";
      license = licenses.mit;
      maintainers = with maintainers; [ wiedzmin ];
      platforms = platforms.all;
  };
}
