---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
  },
  config = function() require("telescope").load_extension "live_grep_args" end,
  opts = function(_, opts)
    opts.defaults.layout_config = {
      horizontal = { prompt_position = "top", preview_width = 0.40 },
      vertical = { mirror = false },
      width = 0.99,
      height = 0.99,
      preview_cutoff = 120,
    }
  end,
}
