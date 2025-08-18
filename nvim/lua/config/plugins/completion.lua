return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
    version = "v0.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "enter", ["<Esc>"] = { "hide", "fallback" } },

      enabled = function()
        local filetype = vim.bo[0].filetype

        if filetype == "TelescopePrompt" then
          return false
        end

        return vim.bo.buftype ~= "nofile" and vim.bo.buftype ~= "prompt"
      end,

      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "emoji" },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 93,
            opts = { insert = true },
          },
        },
      },
      signature = { enabled = true },
      cmdline = {
        enabled = true,
        keymap = { preset = "enter" },
      },
      completion = {
        menu = {
          auto_show = false,
          border = "single",
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },
    },
  },
}
