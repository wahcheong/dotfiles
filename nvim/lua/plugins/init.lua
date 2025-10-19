local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- 按功能模块导入插件
  { import = 'plugins.modules.ui' },           -- 用户界面
  { import = 'plugins.modules.editor' },       -- 编辑器增强
  { import = 'plugins.modules.coding' },       -- 代码开发
  { import = 'plugins.modules.navigation' },   -- 导航搜索
  { import = 'plugins.modules.tools' },        -- 工具插件
  { import = 'plugins.modules.ai' },           -- AI工具

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  git = {
    timeout = 300, -- Seconds
  },
  install = {
    colorscheme = { "tokyonight", "habamax"},
    missing = true,
  },
  checker = {
    -- Check for plugin updates periodically
    enabled = true,
    -- Notify on update
    notify = true,
  },
  performance = {
    rtp = {
      -- Disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
})
