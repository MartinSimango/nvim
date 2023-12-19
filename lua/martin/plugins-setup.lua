-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("bluz71/vim-nightfly-guicolors")
    
    -- color scheme
    use("Mofiqul/vscode.nvim")
  
    -- windowing
    use("christoomey/vim-tmux-navigator")

    -- surrounding words with characters
    use("tpope/vim-surround")

    -- commenting
    use("numToStr/Comment.nvim")

    use("nvim-lua/plenary.nvim")

    -- file explorer
  --  use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-tree.lua")


    use("szw/vim-maximizer")

    use("nvim-tree/nvim-web-devicons")

    -- use("akinsho/toggleterm.nvim")
   use("ChristianChiarulli/toggleterm.nvim")
   use("nvim-lualine/lualine.nvim")
 
  if packer_bootstrap then
    require("packer").sync()
  end
end)
