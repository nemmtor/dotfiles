local vtsls_inlay_hints = {
  enumMemberValues = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  functionParameterTypes = { enabled = true },
  parameterNames = { enabled = "all" },
  parameterNameWhenArgumentMatchesNames = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  variableTypes = { enabled = true },
  variableTypeWhenTypeMatchesNames = { enabled = true },
}

local function get_capabilities()
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  capabilities.general = capabilities.general or {}
  capabilities.general.positionEncodings = { "utf-16" }
  return capabilities
end

-- local handlers = {
--   function(server_name)
--     local capabilities = require("blink.cmp").get_lsp_capabilities()
--     require("lspconfig")[server_name].setup({ capabilities })
--   end,
-- ["denols"] = function()
--   local lspconfig = require("lspconfig")
--   lspconfig.denols.setup({
--     root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--   })
-- end,
-- }

return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
      {
        "mason-org/mason-lspconfig.nvim",
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
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = get_capabilities(),
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.tailwindcss.setup({
        capabilities = get_capabilities(),
      })
      lspconfig.biome.setup({
        capabilities = get_capabilities(),
      })
      lspconfig.vtsls.setup({
        capabilities = get_capabilities(),
        single_file_support = false,
        root_dir = lspconfig.util.root_pattern(".git"),
        on_attach = function(client, bufnr)
          require("twoslash-queries").attach(client, bufnr)
        end,
        settings = {
          complete_function_calls = true,
          vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            tsserver = {
              maxTsServerMemory = 12288,
              pluginPaths = { "./node_modules" },
            },
            inlayHints = vtsls_inlay_hints,
          },
          javascript = { inlayHints = vtsls_inlay_hints },
        },
      })
      -- TODO: enable in eslint repos
      -- lspconfig.eslint.setup({
      --   settings = {
      --     workingDirectory = {
      --       mode = "auto",
      --     },
      --     workingDirectories = {
      --       mode = "auto",
      --     },
      --     options = {
      --       -- only for eslint@9
      --       flags = { "unstable_config_lookup_from_file" },
      --     },
      --   },
      -- })

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

      require("mason-tool-installer").setup({
        ensure_installed = {
          -- "prettier",
          -- "eslint",
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
      vim.keymap.set("n", "<space>lc", function()
        local has_eslint = false
        local has_biome = false
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        for _, client in ipairs(clients) do
          if client.name == "eslint" then
            has_eslint = true
            break
          end

          if client.name == "biome" then
            has_biome = true
            break
          end
        end

        local command_exists = vim.fn.exists(":EslintFixAll") > 0

        if has_eslint and command_exists then
          vim.cmd("EslintFixAll")
        elseif has_biome then
          vim.notify("Not doable with Biom", vim.log.levels.INFO)
        else
          vim.notify("No linter attached", vim.log.levels.WARN)
        end
      end, { desc = "[L]sp [L]int Fix All" })
    end,
  },
}
