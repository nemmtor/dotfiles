return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', build = "make"
    }
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },
      extensions = {
        fzf = {}
      },
    })
    require('telescope').load_extension('fzf')
    vim.keymap.set("n", "<space>sf", require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<space>sh", require('telescope.builtin').help_tags, { desc = "[S]earch [H]elp" })

    vim.keymap.set("n", "<space>sc", function()
      require('telescope.builtin').find_files({
        cwd = vim.fn.stdpath("config")
      })
    end, { desc = "[S]earch [C]onfig" })

    vim.keymap.set("n", "<space>sp", function()
      require('telescope.builtin').find_files({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      })
    end, { desc = "[S]earch [P]lugins" })

    vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end,
      { desc = "[G]o to [R]eference" })

    vim.keymap.set("n", "<space>?", function() require("telescope.builtin").oldfiles() end,
      { desc = "[S]earch Old files" })

    require "config.telescope.multigrep".setup()
    require "config.telescope.notifications".setup()
  end
}
