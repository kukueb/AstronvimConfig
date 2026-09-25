return {
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "Mathijs-Bakker/godotdev.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "gdscript", "gdshader", "gdresource" },
    opts = {
      editor_host = "127.0.0.1",
      editor_port = 6005, -- LSP-порт Godot
      debug_port = 6006, -- DAP-порт Godot
    },
  },
}
