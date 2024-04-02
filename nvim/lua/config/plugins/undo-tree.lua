return {
  "mbbill/undotree",
  enabled = false,
  config = function()
    vim.keymap.set("n", "<F3>", function()
      vim.cmd.UndotreeToggle()
      vim.cmd.UndotreeFocus()
    end, { desc = "Toggle undo tree" })
  end,
}
