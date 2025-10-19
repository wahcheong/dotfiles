local autocmd = vim.api.nvim_create_autocmd

autocmd('InsertEnter', {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
})
