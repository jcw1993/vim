require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

function setup_python_file()
    vim.fn.append(0, "#!/usr/bin/env python3")
    vim.fn.append(1, "# -*- coding: utf-8 -*-")
    vim.fn.append(3, 'if __name__ == "__main__":')
    vim.fn.append(4, "    pass")
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_exec([[
augroup PythonAutoCommands
    autocmd!
    autocmd BufNewFile *.py lua setup_python_file()
augroup END
]], false)

