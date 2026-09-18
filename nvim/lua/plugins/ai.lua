return {
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Disable tab mapping for Copilot
      vim.g.copilot_no_tab_map = true
      -- Support git commit messages
      vim.g.copilot_filetypes = {
        gitcommit = true,
      }
      -- Map Ctrl-J to accept Copilot suggestion
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = "Accept Copilot suggestion",
      })
    end,
  },
}
