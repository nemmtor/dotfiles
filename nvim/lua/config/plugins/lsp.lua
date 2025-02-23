local handlers = {
  function(server_name)
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("lspconfig")[server_name].setup({ capabilities })
  end,
  ["lua_ls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
  ["vtsls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.vtsls.setup({
      single_file_support = false,
      root_dir = lspconfig.util.root_pattern("package.json"),
    })
  end,
  -- ["denols"] = function()
  --   local lspconfig = require("lspconfig")
  --   lspconfig.denols.setup({
  --     root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  --   })
  -- end,
}

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      { "saghen/blink.cmp" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls",
          -- "denols",
          "marksman",
          "tailwindcss",
          "vimls",
          -- "clangd",
        },
      })
      require("mason-lspconfig").setup_handlers(handlers)
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- "prettier",
          "eslint_d",
          -- "eslint-lsp",
          "stylua",
          -- "clang-format",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end
        end,
      })

      vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { desc = "[L]sp [R]ename" })
      vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, { desc = "[L]sp [A]ction" })
    end,
  },
}
