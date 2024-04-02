return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        columns = { "icon" },
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".git" or name == ".DS_STORE"
          end,
        },
        win_options = {
          wrap = true,
        },
        float = {
          padding = 5,
        },
      })
      vim.keymap.set(
        "n",
        "<F1>",
        "<cmd>lua require('oil').toggle_float()<CR>",
        { noremap = true, silent = true, desc = "Toggle Filetree" }
      )
    end,
  },
}
