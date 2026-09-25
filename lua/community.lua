-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.godot" },
  -- import/override with your plugins folder
  {
    "Mathijs-Bakker/godotdev.nvim",
    dependencies = { "nvim-dap", "nvim-dap-ui", "nvim-treesitter" },
  },
  { import = "astrocommunity.code-runner.molten-nvim" },
}
