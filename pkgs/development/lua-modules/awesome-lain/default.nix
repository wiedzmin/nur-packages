{ fetchFromGitHub, lib, luaPackages, stdenv }:
let
  luaversion = luaPackages.lua.luaversion;
in
luaPackages.toLuaModule (stdenv.mkDerivation rec {
  name = "awesome-lain";

  src = fetchFromGitHub {
    owner = "lcpz";
    repo = "lain";
    rev = "1db09ba186b076abb34f60e92761bd612b4dc851";
    sha256 = "12h1abr4xjr322by87sxrwqfpmyawziaxgk1lzicx0z6ywy0ch05";
  };

  buildInputs = [ luaPackages.lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${luaversion}/
    cp -r . $out/lib/lua/${luaversion}/lain/
    printf "package.path = '$out/lib/lua/${luaversion}/?/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${luaversion}/lain.lua
  '';
})
