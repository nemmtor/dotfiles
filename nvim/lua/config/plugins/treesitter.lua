return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/nvim-treesitter-context" }
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "c",
          "css",
          "scss",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "javascript",
          "typescript",
          "cpp",
          "bash",
          "cmake",
          "comment",
          "dot",
          "dockerfile",
          "editorconfig",
          "fish",
          "gitcommit",
          "git_config",
          "git_rebase",
          "gitignore",
          "go",
          "graphql",
          "html",
          "http",
          "jsdoc",
          "json",
          "make",
          "nginx",
          "nix",
          "ocaml",
          "php",
          "java",
          "kotlin",
          "pod",
          "prisma",
          "python",
          "robots",
          "ruby",
          "rust",
          "scala",
          "sql",
          "ssh_config",
          "svelte",
          "vue",
          "yaml",
        },
        auto_install = false,

        highlight = {
          enable = true,

          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
}
