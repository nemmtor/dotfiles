local M = {}

M.apply_keymaps = function()
  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<space>tr", "<cmd>PlenaryBustedFile %<CR>", { desc = "[T]ests [R]un" })
  vim.keymap.set("n", "<space>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
  vim.keymap.set("n", "<space>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

  vim.keymap.set("n", "<space>sc", function()
    builtin.find_files({
      cwd = vim.fn.stdpath("config"),
    })
  end, { desc = "[S]earch [C]onfig" })

  vim.keymap.set("n", "<space>sp", function()
    builtin.find_files({
      cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
    })
  end, { desc = "[S]earch [P]lugins" })

  vim.keymap.set("n", "<space>sr", function()
    builtin.resume()
  end, { desc = "[S]earch [R]esume" })

  vim.keymap.set("n", "<space>sch", function()
    builtin.command_history()
  end, { desc = "[S]earch [C]ommand [H]istory" })

  vim.keymap.set("n", "<space>ssh", function()
    builtin.search_history()
  end, { desc = "[S]earch [S]earch [H]istory" })

  vim.keymap.set("n", "<space>sth", function()
    builtin.pickers()
  end, { desc = "[S]earch [T]elescpe [H]istory" })

  vim.keymap.set("n", "gr", function()
    builtin.lsp_references()
  end, { desc = "[G]o to [R]eference" })

  vim.keymap.set("n", "gd", function()
    builtin.lsp_definitions()
  end, { desc = "[G]o to [D]efinition" })

  vim.keymap.set("n", "gi", function()
    builtin.lsp_implementations()
  end, { desc = "[G]o to [I]mplementations" })

  vim.keymap.set("n", "gt", function()
    builtin.lsp_type_definitions()
  end, { desc = "[G]o to [T]ype" })

  vim.keymap.set("n", "<space>?", function()
    builtin.oldfiles()
  end, { desc = "[S]earch Old files" })

  local extensions = require("telescope").extensions

  vim.keymap.set("n", "<space>sg", function()
    extensions.live_grep_args.live_grep_args()
  end, { desc = "[S]earch [G]rep" })

  local live_grep_args = require("telescope-live-grep-args.shortcuts")

  vim.keymap.set("n", "<space>swu", function()
    live_grep_args.grep_word_under_cursor()
  end, { desc = "[S]earch [W]ord [U]nder" })

  vim.keymap.set("v", "<space>ssu", function()
    live_grep_args.grep_visual_selection()
  end, { desc = "[S]earch [S]election [U]nder" })
end

return M
