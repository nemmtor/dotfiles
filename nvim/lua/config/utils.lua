local M = {}

--- @param bufnr number
M.is_deno_project = function(bufnr)
  return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(bufnr)
end

return M
