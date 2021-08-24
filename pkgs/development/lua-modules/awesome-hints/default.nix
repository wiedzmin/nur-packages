{ fetchFromGitHub, lib, luaPackages, stdenv, patches ? [ ./restored-working-version-from-blob.patch ] }:
let
  luaversion = luaPackages.lua.luaversion;
in
luaPackages.toLuaModule (stdenv.mkDerivation rec {
  name = "awesome-hints";

  src = fetchFromGitHub {
    owner = "zackpete";
    repo = "hints";
    rev = "714c390487458aeadc93659257c72f56d26df041";
    sha256 = "0pzq7321143xwlnrlhyy0a5inryrkwjax9pcjs7rma088f4vldgc";
  };

  buildInputs = [ luaPackages.lua ];

  inherit patches;

  installPhase = ''
    mkdir -p $out/lib/lua/${luaversion}/
    cp -r . $out/lib/lua/${luaversion}/hints/
    mv $out/lib/lua/${luaversion}/hints/hints.lua $out/lib/lua/${luaversion}/hints/init.lua
    printf "package.path = '$out/lib/lua/${luaversion}/?/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${luaversion}/hints.lua
  '';
})
