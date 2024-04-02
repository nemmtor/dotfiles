return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.animate").setup()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.indentscope").setup()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.surround").setup()
      require("mini.trailspace").setup()

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHiPatternsTodo" },
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHiPatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHiPatternsHack" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHiPatternsNote" },
        },

        hex_color = hipatterns.gen_highlighter.hex_color(),
      })

      local notify = require("mini.notify")
      notify.setup()
      vim.notify = notify.make_notify({
        ERROR = { duration = 2000 },
        WARN = { duration = 1000 },
        INFO = { duration = 1000 },
      })
    end,
  },
}
