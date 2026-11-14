{
  description = "LaTeX (full TeX Live) dev shell for grad school applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.texliveFull # complete TeX Live distribution
            pkgs.biber       # bibliography backend for biblatex
            pkgs.texlab      # LSP (optional, for editors)
          ];
        };
      });
}
