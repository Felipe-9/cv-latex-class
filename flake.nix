{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {

        packages.default = pkgs.stdenv.mkDerivation {
          name = "Felipe Pinto's CV LaTeX Class";
          src = ./source;
          installPhase = ''
            mkdir -p $out/tex/latex
            cp -r $src/fp-cv.cls $out/tex/latex
          '';
          passthru.tlType = "run";
        };

        devShells.default =
          let
            texlive = pkgs.texlive.combine {
              pkgFilter = pkg: with pkg; tlType == "run" || tlType == "bin" || tlType == "doc";

              fp-cv.pkgs = [ self.packages.${system}.default ];
              inherit (pkgs.texlive)
                scheme-basic

                # Depedencies
                adjustbox
                etoolbox
                fontawesome6
                fontsize
                fontspec
                geometry
                graphics
                hyperref
                latexmk
                luacode
                luatexbase
                setspace
                xcolor

                ;
            };
          in
          pkgs.mkShell { buildInputs = [ texlive ]; };
      }
    );
}
