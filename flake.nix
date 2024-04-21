{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default =
        with import nixpkgs
          {
            inherit system;
          }; mkShell rec {

          buildInputs = [
            nodePackages.pnpm
          ];

          shellHook = ''
            [[ -v SHELL ]] && exec "$SHELL"
          '';
        };
    });
}
