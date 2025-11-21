return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local conform = require("conform")
    local format_settings = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
      lsp_format = "never",
    }

    local js_filetypes = require("config.constants").JAVASCRIPT_FIlE_TYPES

    --- @type table<string, string[]|function>
    local formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      ruby = { "standardrb" },
    }

    for _, ft in ipairs(js_filetypes) do
      -- formatters_by_ft[ft] = { "biome", "prettier", "deno_fmt" }
      formatters_by_ft[ft] = { "biome", "biome-organize-imports" }
    end

    conform.setup({
      formatters_by_ft = formatters_by_ft,
      format_on_save = format_settings,
    })

    vim.keymap.set("n", "<space>lf", function()
      conform.format(format_settings)
    end, { desc = "[L]sp [F]ormat" })
  end,
}
