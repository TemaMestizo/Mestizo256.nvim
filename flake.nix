{
  description = "Un tema oscuro de Neovim para los que no salen de casa";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = pkgs.lib;
    in
    {
      devShells.${system} = {
        default = import ./nix/shell-de-desarrollo.nix { inherit pkgs; };
        pruebas = import ./nix/shell-de-pruebas.nix { inherit pkgs lib; };
      };
    };
}
