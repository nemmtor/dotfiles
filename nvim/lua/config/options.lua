vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes:1"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})

vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
