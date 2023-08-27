-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Insert mode --
-----------------

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'Jk', '<ESC>')
vim.keymap.set('i', 'JK', '<ESC>')

-----------------
-- Normal mode --
-----------------

-- for nvim-tree
-- default leader key: \
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)

-- Hint: see `:h vim.map.set()`
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<C-p>', ':FZF<CR>', opts)

vim.keymap.set('n', '<leader>1', '1gt', opts)
vim.keymap.set('n', '<leader>2', '2gt', opts)
vim.keymap.set('n', '<leader>3', '3gt', opts)
vim.keymap.set('n', '<leader>4', '4gt', opts)
vim.keymap.set('n', '<leader>5', '5gt', opts)
vim.keymap.set('n', '<leader>6', '6gt', opts)
vim.keymap.set('n', '<leader>7', '7gt', opts)
vim.keymap.set('n', '<leader>8', '8gt', opts)
vim.keymap.set('n', '<leader>9', '9gt', opts)
vim.keymap.set('n', '<leader>0', ':tablast<CR>', opts)
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)

vim.keymap.set('n', '<leader>v', ':vsplit<CR>', opts)

vim.keymap.set('n', 's', '<Plug>(easymotion-s2)', opts)
vim.keymap.set('n', '<leader>j', '<Plug>(easymotion-j)', opts)
vim.keymap.set('n', '<leader>k', '<Plug>(easymotion-k)', opts)
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

