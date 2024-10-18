{ rustPlatform
, fetchFromGitHub
, libevdev
,
}:
rustPlatform.buildRustPackage rec {
  pname = "xremap";
  version = "v0.10.1";

  src = fetchFromGitHub {
    owner = "k0kubun";
    repo = "xremap";
    rev = version;
    sha256 = "sha256-TZvi5EOZ5Ekg8aGXCAzCcphJ7U5YsPtTWKTUQKZXEsg=";
  };

  buildFeatures = [ "x11" ]; # FIXME: elaborate some features setting logic
  cargoHash = "sha256-G9hQMAjCSoSPuLboH3OxxvsJlDqZ+7t/beQXcDCp1FQ=";

  meta.mainProgram = "xremap";
}
