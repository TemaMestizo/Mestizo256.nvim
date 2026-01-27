return {
  ["config"] = (function()
  vim.opt.runtimepath:prepend("/nix/store/xxcr6d30wx3g7m7x8gp8wib7vphdn08c-vimplugin-nvim-treesitter-2025-05-24")
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
  })
end
),
  ["dependencies"] = {
    {
      ["dir"] = "/nix/store/qhprlbbq4n4vsc3w2zzs9xfx822g5lad-vimplugin-treesitter-grammar-go"
    },
    {
      ["dir"] = "/nix/store/v6q3j748i5xq7zmnragg8d725z3hx6zw-vimplugin-treesitter-grammar-typescript"
    },
    {
      ["dir"] = "/nix/store/pm4f0hvgpylp64may7bgjj8nnppy1zhw-vimplugin-treesitter-grammar-javascript"
    },
    {
      ["dir"] = "/nix/store/rpj3bwwvzw010akxycadwxbjpx3f6v97-vimplugin-treesitter-grammar-jsdoc"
    },
    {
      ["dir"] = "/nix/store/giv5qvshnfykkscanyj1ihz3cnif8riw-vimplugin-treesitter-grammar-lua"
    },
    {
      ["dir"] = "/nix/store/i6x5ic3myfil9p4i95yn8b8fxc881v2n-vimplugin-treesitter-grammar-luadoc"
    },
    {
      ["dir"] = "/nix/store/9rns50mgpk1s22rv6s66xzh57igr2acq-vimplugin-treesitter-grammar-gitcommit"
    },
    {
      ["dir"] = "/nix/store/qz4lh2fnzimaik9603fwycgqqca19rzz-vimplugin-treesitter-grammar-gitignore"
    },
    {
      ["dir"] = "/nix/store/sc0i436703bx9hh5yda88r95iy1zamdj-vimplugin-treesitter-grammar-git_config"
    },
    {
      ["dir"] = "/nix/store/hl379llq4nip859qb2rxjzrngl2bimwc-vimplugin-treesitter-grammar-git_rebase"
    },
    {
      ["dir"] = "/nix/store/c0fv6jbvrj9xjh174rdndj5d8wpj13h4-vimplugin-treesitter-grammar-gitattributes"
    }
  },
  ["dir"] = "/nix/store/xxcr6d30wx3g7m7x8gp8wib7vphdn08c-vimplugin-nvim-treesitter-2025-05-24"
}
