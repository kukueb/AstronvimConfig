return {
  {
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      vim.g.suda_smart_edit = 1
      vim.opt.shortmess:append({ W = true, F = true, s = true })
    end,
  },
}
