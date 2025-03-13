{
  description = "Arm Project";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            pkgsCross.arm-embedded.buildPackages.gcc
            pkgsCross.armv7l-hf-multiplatform.buildPackages.gcc
            pkgsCross.armv7l-hf-multiplatform.glibc.static
          ];
        };
      }
    );
}
