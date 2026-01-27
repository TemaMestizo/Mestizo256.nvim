{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    nil
    nixd
    nixfmt
    lua-language-server
    stylua
    lua
  ];
}
