{ pkgs, lib }:
pkgs.mkShell {
  packages = with pkgs; [
    neovim-unwrapped

    lua-language-server
    stylua
    typescript-language-server
    biome
    go
    gopls
  ];

  HOME = "./home";
  XDG_CONFIG_HOME = "./home/.config";

  shellHook =
    let
      treesitter = {
        dir = "${pkgs.vimPlugins.nvim-treesitter}";
        dependencies =
          with pkgs.vimPlugins.nvim-treesitter-parsers;
          [
            go
            typescript
            javascript
            jsdoc
            lua
            luadoc
          ]
          |> map (gramatica: {
            dir = "${gramatica}";
          });
        config = lib.mkLuaInline /* lua */ ''
          function()
            vim.opt.runtimepath:prepend("${pkgs.vimPlugins.nvim-treesitter}")
            require("nvim-treesitter.configs").setup({
              highlight = { enable = true },
              indent = { enable = true },
            })
          end
        '';
      };

      archivoDeComplementoTreesitter = pkgs.writeText "treesitter.lua" /* lua */ ''
        return ${lib.generators.toLua { } treesitter}
      '';
    in
    /* sh */ ''
      mkdir -p $HOME
      mkdir -p $XDG_CONFIG_HOME

      cp ${archivoDeComplementoTreesitter} ./home/.config/nvim/lua/complementos/treesitter.lua
    '';
}
