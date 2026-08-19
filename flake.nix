{
  description = "Un tema oscuro de Neovim para los que no salen de casa";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./nix/shell-de-desarrollo.nix
        ./nix/shell-de-pruebas.nix
      ];
    };
}
