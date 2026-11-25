---@type LazySpec
return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  config = function(_, opts)
    vim.lsp.config("roslyn", {
      cmd = {
        "Microsoft.CodeAnalysis.LanguageServer",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
        "--stdio",
      },
    })
    require("roslyn").setup(opts)
  end,
  ---@module "roslyn.config"
  ---@type RoslynNvimConfig
  opts = {},
}
