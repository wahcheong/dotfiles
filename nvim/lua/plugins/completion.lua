return {
  -- Completion framework for Neovim
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP semantic completion
      "hrsh7th/cmp-buffer",   -- Buffer words completion
      "hrsh7th/cmp-path",     -- Path completion
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        -- Dummy snippet expander required by nvim-cmp
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body) -- Built-in snippet expansion (Neovim 0.10+)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Clean & simple <Tab> / <S-Tab> selection
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Active completion sources
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
