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
    rev = "5b5e31621f42bbe5961b459a9ed2379c1c26d026";
    sha256 = "07bp8q63q9hjf8pbbsykblf3vxr2plr8a3bsp12nr8s9cssfc80s";
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
