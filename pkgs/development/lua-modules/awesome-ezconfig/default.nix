{ fetchFromGitHub, lib, luaPackages, stdenv }:
let
  luaversion = luaPackages.lua.luaversion;
in
luaPackages.toLuaModule (stdenv.mkDerivation rec {
  name = "awesome-ezconfig";

  src = fetchFromGitHub {
    owner = "gvalkov";
    repo = "awesome-ezconfig";
    rev = "59f6fc80597fba8714e2ca068e5640e2a69a9999";
    sha256 = "002727y7iarbrx0r105bzr0ng5k412ml9870ah72x3sv335gx219";
  };

  buildInputs = [ luaPackages.lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${luaversion}/
    cp -r . $out/lib/lua/${luaversion}/ezconfig/
    mv $out/lib/lua/${luaversion}/ezconfig/ezconfig.lua $out/lib/lua/${luaversion}/ezconfig/init.lua
    printf "package.path = '$out/lib/lua/${luaversion}/?/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${luaversion}/ezconfig.lua
  '';
})
