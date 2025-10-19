return {
  -- Allows seamless navigation between vim and tmux splits
  -- https://github.com/christoomey/vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.g.tmux_navigator_no_mappings = 0
      vim.g.tmux_navigator_save_on_switch = 0
    end,
  },
}
