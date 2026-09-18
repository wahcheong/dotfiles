return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
      { "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in tree" },
    },
    opts = {
      view = {
        number = false,
        relativenumber = false,
      },
      git = {
        ignore = false,  -- Set to false to show gitignored files in the tree
      },
    },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>g", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>gc", "<cmd>Telescope git_status<cr>", desc = "Git changed files" },
      { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
    opts = {},
  },

  -- Gitsigns: show Git status signs in the sign column.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },

  -- Diffview: view Git diffs in a side-by-side view.
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
  },

  -- Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "vim",
          "vimdoc",
          "yaml",
        },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Seamless vim ↔ tmux pane navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
