require('options')
require('plugins')
require('keymaps')
require('colorscheme')
require('lsp')

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
  vim.cmd("wincmd l")
end

function setup_python_file()
    vim.fn.append(0, "#!/usr/bin/env python3")
    vim.fn.append(1, "# -*- coding: utf-8 -*-")
    vim.fn.append(3, 'if __name__ == "__main__":')
    vim.fn.append(4, "    pass")
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit") -- 如果只剩下 NvimTree 窗口，则退出
    end
  end,
})


vim.api.nvim_exec([[
augroup PythonAutoCommands
    autocmd!
    autocmd BufNewFile *.py lua setup_python_file()
augroup END
]], false)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


