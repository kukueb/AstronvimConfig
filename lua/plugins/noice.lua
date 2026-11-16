return {
  -- stop snacks from handling vim.notify
  {
    "folke/snacks.nvim",
    opts = { notifier = { enabled = false } },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      -- only take over notifications, leave cmdline/messages/popupmenu alone
      cmdline = { enabled = false },
      messages = { enabled = false },
      popupmenu = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      routes = {
        { filter = { event = "notify" }, view = "mini" },
      },
      views = {
        mini = {
          position = { row = -2, col = 0 }, -- bottom-left, above the statusline
          align = "message-left",
          timeout = 3000,
        },
      },
    },
  },
}
