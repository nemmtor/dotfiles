return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")

      oil.setup({
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
        keymaps = {
          ["Y"] = {
            desc = "Copy filepath to system clipboard",
            mode = "n",
            callback = function()
              local entry = oil.get_cursor_entry()
              local dir = oil.get_current_dir()

              if not entry or not dir then
                return
              end

              local relpath = vim.fn.fnamemodify(dir, ":.")

              vim.fn.setreg("+", relpath .. entry.name)
            end,
          },
          ["q"] = {
            desc = "Close Oil",
            mode = "n",
            callback = function()
              oil.close()
            end,
          },
        },
        win_options = {
          wrap = true,
        },
        float = {
          padding = 5,
        },
      })

      vim.keymap.set("n", "<F1>", function()
        oil.toggle_float()
      end, { noremap = true, silent = true, desc = "Toggle Filetree" })
    end,
  },
}
