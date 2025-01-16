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
        require("nvim-tree").setup {
        }
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

--local fzf = {
    --"junegunn/fzf",
    --build = "./install --bin"
--}

--local fzfvim = {
    --"junegunn/fzf.vim",
--}

--local fzf_lsp = {
    --"ojroques/nvim-lspfuzzy",
    --config = function()
        --require('lspfuzzy').setup {}
    --end
--}

local telescope = {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('telescope').setup({
          defaults = {
            mappings = {
              i = { -- 插入模式
                ["<C-j>"] = require('telescope.actions').move_selection_next, -- 下移
                ["<C-k>"] = require('telescope.actions').move_selection_previous, -- 上移
                ["<C-l>"] = require('telescope.actions').close,
              },
              n = { -- 正常模式
                ["<C-j>"] = require('telescope.actions').move_selection_next, -- 下移
                ["<C-k>"] = require('telescope.actions').move_selection_previous, -- 上移
                ["<C-l>"] = require('telescope.actions').close,
              },
            },
          },
        })
    end
}

local barbecue = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
}

local easymotion = {
    "easymotion/vim-easymotion"
}

local delimitmate = {
    "raimondi/delimitmate"
}

local commenter = {
    'preservim/nerdcommenter'
}

local outline = {
    'simrat39/symbols-outline.nvim',
    config = function()
        require('symbols-outline').setup()
    end
}

local mason = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { 'pyright', 'gopls', 'lua_ls', 'rust_analyzer', 'clangd', 'jdtls', 'kotlin_language_server' },
        })
    end
}

local copilot = {
    "github/copilot.vim"
}

local nvim_cmp = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ['<S-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true ,
                    behavior = cmp.ConfirmBehavior.Replace
                }),
                ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' })
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "vsnip" },
            }, {
                { name = "buffer" },
            }),
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources{
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end
}

local flutter = {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup {
            fvm = true,
        }
    end
}


--local bundle = { nvim_tree, colorscheme, barbecue, lualine, fzf, fzfvim, telescope, easymotion, delimitmate, commenter, outline, mason, nvim_cmp, flutter, copilot, fzf_lsp }
local bundle = { nvim_tree, colorscheme, barbecue, lualine, telescope, easymotion, delimitmate, commenter, outline, mason, nvim_cmp, flutter, copilot }

require("lazy").setup(bundle)
