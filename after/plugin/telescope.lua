-- ~/.config/nvim/after/plugin/telescope.lua
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>l', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
  require('telescope.builtin').live_grep({ cwd = vim.loop.cwd() })
end, { desc = 'Telescope live grep with cwd' })

