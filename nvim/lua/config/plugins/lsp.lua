local handlers = {
  function(server_name)
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    require("lspconfig")[server_name].setup { capabilities }
  end,
  ["lua_ls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        },
      }
    }
  end,
  ["ts_ls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.ts_ls.setup {
      single_file_support = false,
      root_dir = lspconfig.util.root_pattern("package.json"),
    }
  end,
  ["denols"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.denols.setup {
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    }
  end


}


return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
      },
      { "saghen/blink.cmp" },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        "neovim/nvim-lspconfig"
      },
      { "saghen/blink.cmp" }
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers(handlers)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end,
      })

      vim.keymap.set("n", "<space>lf", function() vim.lsp.buf.format() end, { desc = "[L]sp [F]ormat" })
      vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, { desc = "[L]sp [R]ename" })
      vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, { desc = "[L]sp [A]ction" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
    end
  },
}
