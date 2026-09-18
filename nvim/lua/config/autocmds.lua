local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Toggle relative line numbers in insert mode
augroup("NumberToggle", { clear = true })

autocmd("InsertEnter", {
  group = "NumberToggle",
  callback = function()
    if vim.wo.number then
      vim.opt_local.relativenumber = false
    end
  end,
})

autocmd("InsertLeave", {
  group = "NumberToggle",
  callback = function()
    if vim.wo.number then
      vim.opt_local.relativenumber = true
    end
  end,
})
