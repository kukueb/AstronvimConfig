return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    servers = { "arduino_language_server" },
    config = {
      arduino_language_server = {
        cmd = {
          "arduino-language-server",
          "-cli",
          "arduino-cli",
          "-cli-config",
          "arduino-cli.yaml", -- adjust, see note below
          "-clangd",
          "/nix/store/zfddngfax7va58fsx3cq1yjsmxy74l5c-clang-tools-21.1.8/bin/clangd",
          "-fqbn",
          "arduino:avr:uno",
        },
        capabilities = {
          textDocument = { semanticTokens = vim.NIL },
          workspace = { semanticTokens = vim.NIL },
        },
        before_init = function(params)
          if params.capabilities then
            if params.capabilities.textDocument then params.capabilities.textDocument.semanticTokens = nil end
            if params.capabilities.workspace then params.capabilities.workspace.semanticTokens = nil end
          end
        end,
      },
    },
  },
}
