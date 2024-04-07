return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    { "<leader>rp", function() require("spectre").open() end, desc = "Toggle Spectre" },
    { "<leader>rw", function() require("spectre").open_visual({select_word=true}) end, desc = "Search current word" },
  },
}
