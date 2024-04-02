---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.hijack_netrw_behavior = "open_default"
    opts.hide_root_node = true
    opts.add_blank_line_top = true
    opts.retain_hidden_root_ident = true
    opts.filesystem.filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
    }
    opts.window.position = "right"
    opts.window.width = 50
    opts.window.mappings["<cr>"] = "open_with_window_picker"
    opts.window.mappings["s"] = "split_with_window_picker"
    opts.window.mappings["S"] = "vsplit_with_window_picker"
    opts.source_selector.sources = {
      { source = "filesystem", display_name = "" },
    }
    opts.enable_git_status = true
    opts.git_status_async = true
  end,
}
