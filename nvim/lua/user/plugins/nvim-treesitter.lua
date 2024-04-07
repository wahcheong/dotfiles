return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the four listed parsers should always be installed)
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "rust",
        "javascript",
        "json",
        "yaml",
        "xml",
        "proto",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
      },
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {},
      },
    })
  end
}
