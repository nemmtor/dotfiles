-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        so = 5,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["|"] = false,
        ["\\"] = false,
        ["J"] = { "mzJ`z", desc = "Better merge lines" },
        ["n"] = { "nzzzv", desc = "Better search next" },
        ["N"] = { "Nzzzv", desc = "Better search prev" },
        ["<Leader>s"] = { desc = "[S]earch" },
        ["<Leader>sg"] = { function() require("telescope.builtin").live_grep() end, desc = "[S]earch [G]rep" },
        ["<Leader>sf"] = {
          function() require("telescope.builtin").find_files { hidden = false } end,
          desc = "[S]earch [F]iles",
        },
        ["<Leader>sga"] = {
          function() require("telescope").extensions.live_grep_args.live_grep_args() end,
          desc = "[S]earch [G]rep [A]rgs",
        },
        ["<Leader>sgw"] = {
          function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end,
          desc = "[S]earch [G]rep [W]ord",
        },
        ["<Leader>sn"] = {
          function() require("telescope").extensions.notify.notify() end,
          desc = "[S]earch [N]otifications",
        },
        ["<Leader>?"] = { function() require("telescope.builtin").oldfiles() end, desc = "[?] old files" },
        ["<Leader>slh"] = {
          function() require("telescope.builtin").command_history() end,
          desc = "[S]earch [L]ine [H]istory",
        },
        ["<Leader>sr"] = {
          function() require("telescope.builtin").resume() end,
          desc = "[S]earch [R]esume",
        },
        ["<F1>"] = { function() require("neo-tree.command").execute { toggle = true } end, desc = "Toggle Explorer" },
        ["<F2>"] = { function() require("outline").toggle() end, desc = "Toggle Outline" },
        ["<F3>"] = {
          function()
            vim.cmd.UndotreeToggle()
            vim.cmd.UndotreeFocus()
          end,
          desc = "Toggle Undo Tree",
        },
        ["<F4>"] = {
          function() require("neotest").summary.toggle() end,
          desc = "Toggle Tests Summary",
        },

        ["<Leader>e"] = false,
        ["<Leader>c"] = false,
        ["<Leader>C"] = false,
        ["<Leader>h"] = false,
        ["<Leader>n"] = false,
        ["<Leader>o"] = false,
        ["<Leader>Q"] = false,
        ["<Leader>q"] = false,
        ["<Leader>w"] = false,
        ["<Leader>b"] = false,
      },
      v = {
        ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line up" },
        ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line down" },
      },
    },
  },
}
