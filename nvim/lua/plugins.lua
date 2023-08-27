local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local nvim_tree = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {}
    end
}

local colorscheme = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}

local lualine = {
    "nvim-lualine/lualine.nvim",
    options = {
        theme = 'tokyonight'
    },
    config = function()
        require('lualine').setup()
    end
}

local fzf = {
    "junegunn/fzf", 
    build = "./install --bin"
}

local telescope = {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('telescope').setup()
    end
}

local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    config = function()
        require('nvim-treesitter').setup()
    end
}

local easymotion = {
    "easymotion/vim-easymotion"
}


local bundle = { nvim_tree, colorscheme, lualine, fzf, telescope, treesitter, easymotion }

require("lazy").setup(bundle)
