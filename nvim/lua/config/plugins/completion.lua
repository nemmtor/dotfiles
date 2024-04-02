return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'enter', ["<Esc>"] = { 'hide', 'fallback' } },

      enabled = function()
        return vim.bo.buftype ~= "nofile" and vim.bo.buftype ~= "prompt"
      end,

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = {
          auto_show = false,
        },
        sources = {
          default = { 'lsp', 'path' },
        },
        signature = { enabled = true },
      }
    },
  },
}
