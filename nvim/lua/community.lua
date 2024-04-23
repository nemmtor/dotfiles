---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- test
  { import = "astrocommunity.test.neotest" },
  -- workflow
  { import = "astrocommunity.workflow.hardtime-nvim" },
  -- colorschemes
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- lsp
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- editing-support
  -- { import = "astrocommunity.editing-support.refactoring-nvim" },
  -- packs
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
}
