return {
  {
    "mason-org/mason.nvim",
    opts = {},
    lazy = false,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",          -- C / C++
        "pyright",         -- Python
        "bashls",          -- Bash
        "buf_ls",          -- Protobuf
        "jsonls",          -- JSON
        "marksman",        -- Markdown
        "ts_ls",           -- JavaScript / TypeScript
        "html",            -- HTML
        "cssls",           -- CSS
        "rust_analyzer",   -- Rust
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
