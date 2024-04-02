return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        cache_picker = {
          num_pickers = 25,
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {},
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")

    require("config.telescope.notifications").setup()
    require("config.telescope.keymaps").apply_keymaps()
  end,
}
