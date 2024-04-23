---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest"
  },
  opts = function(_, config)
    config.adapters = {
      require("neotest-jest") {
        -- jestCommand = "npm test --",
        -- jestConfigFile = "jest.config.ts",
        -- env = { CI = true },
        -- cwd = function() return vim.fn.getcwd() end,
      }
    }
  end
}
