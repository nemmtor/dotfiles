return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    vim.env.ESLINT_D_PPID = vim.fn.getpid()
    local lint = require("lint")
    local js_filetypes = require("config.constants").JAVASCRIPT_FIlE_TYPES

    local js_linter = { "eslint_d" }

    lint.linters_by_ft = {}

    for _, ft in ipairs(js_filetypes) do
      lint.linters_by_ft[ft] = js_linter
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function(args)
        -- local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
        -- local names_override = nil
        --
        -- if vim.tbl_contains(js_filetypes, filetype) then
        --   if require("config.utils").is_deno_project(args.buf) then
        --     names_override = { "deno" }
        --   end
        -- end
        --
        lint.try_lint()
      end,
    })

    vim.keymap.set(
      "n",
      "<space>lc",
      "<cmd>%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>",
      { desc = "[L]sp [C]ode Fix" }
    )
  end,
}
