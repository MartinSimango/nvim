--  local status, _ = pcall(vim.cmd, "colorscheme nightfly")
--  if not status then
--  print("Colorscheme not found!")
--   return 
-- end
--


local setup, vscode = pcall(require,"vscode")
if not setup then 
  return 
end

vscode.load()



