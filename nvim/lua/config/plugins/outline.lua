return {
  "hedyhli/outline.nvim",
  enabled = false,
  config = function()
    require("outline").setup({
      outline_window = {
        position = "left",
        width = 40,
      },
    })
    vim.keymap.set("n", "<F2>", function()
      require("outline").toggle()
    end, { desc = "Toggle outline" })
  end,
}
