return {
  "NeogitOrg/neogit",
  dependencies = { 
    "nvim-lua/plenary.nvim", 
    "sindrets/diffview.nvim" 
  },
  config = true,
  -- Используем keys вместо init для регистрации биндов
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "Open Neogit",
    },
  },
}
