return {
  ["config"] = (function()
  vim.opt.runtimepath:prepend("/nix/store/2z5j8b9w506lpvgkl3qs7q8yc2lw7676-vimplugin-nvim-treesitter-2025-04-30")
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
  })
end
),
  ["dependencies"] = {
    {
      ["dir"] = "/nix/store/19j0dkkdkqqqll7q9v9asg8h6v5p5x4y-vimplugin-treesitter-grammar-go"
    },
    {
      ["dir"] = "/nix/store/l6slhr27i77f6rrphm4kxla7gsa8jzl4-vimplugin-treesitter-grammar-typescript"
    },
    {
      ["dir"] = "/nix/store/y0l3qmqq3d8yrm7p8nqw7sk12sc22ymx-vimplugin-treesitter-grammar-javascript"
    },
    {
      ["dir"] = "/nix/store/3wx4xink3v6sx9vs4rjysi1lgax56ky5-vimplugin-treesitter-grammar-jsdoc"
    },
    {
      ["dir"] = "/nix/store/0n1ss0lalnxka5107rp4pdqvbsgjnv44-vimplugin-treesitter-grammar-lua"
    },
    {
      ["dir"] = "/nix/store/15nqc2z6a6svdayn5v4s8wskx6x7bmn8-vimplugin-treesitter-grammar-luadoc"
    }
  },
  ["dir"] = "/nix/store/2z5j8b9w506lpvgkl3qs7q8yc2lw7676-vimplugin-nvim-treesitter-2025-04-30"
}
