return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>g', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
  end
}
