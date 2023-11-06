{ rustPlatform
, fetchFromGitHub
,
}:
rustPlatform.buildRustPackage rec {
  pname = "xremap";
  version = "v0.8.11";

  src = fetchFromGitHub {
    owner = "k0kubun";
    repo = "xremap";
    rev = version;
    sha256 = "sha256-ruJkOj4lDGCxhyrLhUcaDfIWv7QAUr49fqlvJySpD4c=";
  };

  buildFeatures = [ "x11" ]; # FIXME: elaborate some features setting logic
  cargoSha256 = "sha256-KotTQriYiKsD/vpCbNvYDa9YQRlQxxLjQ+hg5+jaewU=";
}
