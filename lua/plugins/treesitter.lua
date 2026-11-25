-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "gdscript",
      "godot_resource",
      "gdshader",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
