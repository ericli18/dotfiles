local map = vim.keymap.set

map('n', '<leader>E', function()
  require('mini.files').open()
end, { desc = 'File Explorer ' })
map('n', '<leader>e', function()
  require('mini.files').open(vim.fn.expand '%:p:h', false)
end, { desc = 'Explorer: current file’s folder' })

map({ 'n' }, '<leader>w', '<Cmd>update<CR>', { desc = '[W]rite the current buffer.' })
map({ 'n' }, '<leader>Q', '<Cmd>:wqa<CR>', { desc = 'Quit all buffers and write.' })

-- move lines up and down with J and K
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

map('x', '<leader>p', [["_dP]])

-- -- next greatest remap ever : asbjornHaland
-- map({ "n", "v" }, "<leader>y", [["+y]])
-- map("n", "<leader>Y", [["+Y]])
--
-- map({ 'n', 'v' }, '<leader>d', '"_d')

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
