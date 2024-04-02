return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.cursorword").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.surround").setup()
      require("mini.trailspace").setup()

      local mini_ai = require("mini.ai")
      local gen_spec = mini_ai.gen_spec
      mini_ai.setup({
        custom_textobjects = {
          c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          F = gen_spec.function_call(),
        },
      })

      require("mini.indentscope").setup()
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function(args)
          vim.b[args.buf].miniindentscope_disable = true
        end,
      })

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
