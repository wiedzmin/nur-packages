{ lib
, buildGoModule
, fetchFromGitHub
, git
, networkmanager
, xsel
}:
buildGoModule {
  pname = "toolbox";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "toolbox";
    rev = "d38251b330931ed396fbe828a1eacb695263d731";
    sha256 = "02yxaaf9s64q2nzny4xbh8vapcy60lcm2i3qxdxikl8vsx9k9nlf";
  };

  vendorSha256 = "+n1vapvcbyRVXQRMk7fGE7fSPZmmI9ubqhSIlOxbez0=";

  buildInputs = [ git networkmanager xsel ];
  # checkInputs = [ git networkmanager xsel ];

  meta = with lib; {
    description = "Handy scripts from my NixOS configuration, rewritten on Go";
    homepage = "https://github.com/wiedzmin/toolbox";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ wiedzmin ];
    platforms = platforms.all;
  };
}
