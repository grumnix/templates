{
  inputs = rec {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = example;

          example = pkgs.stdenv.mkDerivation rec {
            pname = "example";
            version = "0.0";

            src = ./.;

            postPatch = ''
              substituteInPlace src/Makefile \
                --replace 'fromt_this' 'to_this'
            '';

            buildPhase = ''
              # do nothing
            '';

            installPhase = ''
              # do nothing
            '';

            nativeBuildInputs = [
            ];

            buildInputs = [
            ];

            propagatedBuildInputs = [
            ];
          };
        };
      }
    );
}
