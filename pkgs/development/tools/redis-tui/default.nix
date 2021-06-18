{ buildGoPackage, fetchgit, lib }:

buildGoPackage rec {
  name = "redis-tui-unstable-${version}";
  version = "2019-04-24";
  rev = "2d4e20d0028168981a84761fadfa2b84b25199a1";

  goPackagePath = "github.com/mylxsw/redis-tui";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/mylxsw/redis-tui";
    sha256 = "1sh153vbg4p0jy84mnkvq1wsk4zvmrbs86snjs7sc8mqm5xj3zjz";
  };

  goDeps = ./deps.nix;

  meta = with lib; {
    description = "A Redis Text-based UI client in CLI";
    homepage = "https://github.com/mylxsw/redis-tui";
    license = with licenses; [ gpl2 ];
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ wiedzmin ];
  };
}
