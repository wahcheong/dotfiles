local opt = vim.opt

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "auto"
opt.wrap = false
opt.scrolloff = 3
opt.showmatch = true
opt.showmode = false
opt.laststatus = 2
opt.termguicolors = true
opt.background = "dark"
opt.errorbells = false
opt.visualbell = false

-- Mouse & clipboard
opt.mouse = "nv"
opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.backspace = "indent,eol,start"

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files & buffers
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.autoread = true
opt.list = true
opt.listchars = { tab = "➜·", trail = "·" }

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Timing
opt.timeoutlen = 500
opt.updatetime = 300

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
