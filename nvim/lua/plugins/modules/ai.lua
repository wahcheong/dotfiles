return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
    end,
  },

  -- Copilot Chat
  -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
}
