return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = false,
      typescript = true,
      typescriptreact = true,
      lua = true,
      cpp = true,
    }
  end
}
