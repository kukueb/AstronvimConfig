-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local cwd = vim.fn.getcwd()
if vim.uv.fs_stat(cwd .. "/project.godot") then
  local pipe = cwd .. "/godothost"
  if vim.uv.fs_stat(pipe) then vim.fn.delete(pipe) end -- убрать «мёртвый» сокет
  vim.fn.serverstart(pipe)
end
