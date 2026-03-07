-- return {
--   "lervag/vimtex",
--   lazy = false, -- Плагин должен быть активен для работы авто-команд
--   config = function()
--     -- Указываем Zathura как основной просмотрщик
--     vim.g.vimtex_view_method = "zathura"
--
--     -- Настройка "живой" перезагрузки (Continuous mode)
--     -- По умолчанию VimTeX использует latexmk, который отлично справляется
--     vim.g.vimtex_compiler_latexmk = {
--       continuous = 1, -- 1 = включено (пересборка при сохранении)
--     }
--
--     -- Чтобы Zathura открывалась автоматически при запуске компиляции
--     vim.g.vimtex_view_automatic = 1
--   end,
-- }
--
return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Глобальные настройки должны быть в init
    vim.g.vimtex_view_method = "zathura"
    -- Если вы выбрали запятую как лидер:
    vim.g.maplocalleader = "," 
  end,
  config = function()
    -- Настройки после загрузки
    vim.g.vimtex_compiler_latexmk = {
      continuous = 1,
    }
  end,
}
