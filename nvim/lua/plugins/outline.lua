---@type LazySpec
return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup {
      outline_window = {
        position = "left",
        width = 25
      }
    }
  end
}
