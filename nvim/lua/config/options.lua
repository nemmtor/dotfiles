vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes:1"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true
})
