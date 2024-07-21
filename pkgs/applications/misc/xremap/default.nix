{ rustPlatform
, fetchFromGitHub
, libevdev
,
}:
rustPlatform.buildRustPackage rec {
  pname = "xremap";
  version = "v0.10.0";

  src = fetchFromGitHub {
    owner = "k0kubun";
    repo = "xremap";
    rev = version;
    sha256 = "sha256-TZvi5EOZ5Ekg8aGXCAzCcphJ7U5YsPtTWKTUQKZXEsg=";
  };

  buildFeatures = [ "x11" ]; # FIXME: elaborate some features setting logic
  cargoSha256 = "sha256-2a66jPpb/fdI4EBMUgYW3NTlQGKlsOAUYvZendHK9+o=";
}
