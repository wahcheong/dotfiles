return {
  -- Colorscheme
  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    -- Make sure we load this during startup if it is your main colorscheme 
    lazy = false,
    -- Make sure to load this before all the other start plugins
    priority = 1000,
    config = function()
      require("tokyonight").setup()
      -- Load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Startup screen
  -- https://github.com/goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  -- Statusline
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- File explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
    end,
  },

  -- Indent guides
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },
}
