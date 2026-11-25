-- In lua/plugins/neo-tree.lua (or equivalent user config)
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right", -- Options: "left", "right", "float", "current"
    },
    nesting_rules = {
      unity_meta = {
        pattern = "(.*)%.cs$",
        files = { "%1.cs.meta" },
      },
      gd = {
        pattern = "^(.+)%.gd$",
        files = { "%1.gd.uid" },
      },
      gdshader = {
        pattern = "^(.+)%.gdshader$",
        files = { "%1.gdshader.uid" },
      },
      svg = {
        pattern = "^(.+)%.svg",
        files = { "%1.svg.import" },
      },
    },
  },
}
