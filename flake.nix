{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: {
        devShells.default = with nixpkgs.legacyPackages.${system};
          mkShell {
            buildInputs = [
              hashcat
              hashcat-utils
              (import
                ./princeprocessor.nix
                {inherit stdenv lib;})
              (import
                ./maskprocessor.nix
                {inherit stdenv lib;})
            ];

            shellHook = ''
            '';
          };
      }
    );
}
