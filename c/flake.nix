{
  description = "C Project";
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
          overlays = [
            (import ./overlays/gdb.nix)
          ];
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            gcc
            gdb
            valgrind
          ];
        };
      }
    );
}
