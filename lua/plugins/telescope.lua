return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "%.cache/",
          "dist/",
          "build/",
          ".next",
        },
      },
    })

    -- Keymaps
    vim.keymap.set('n', '<leader><leader>', function()
      builtin.find_files({ hidden = true }) -- includes hidden files
    end, { desc = 'Telescope find files' })

    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })

    vim.keymap.set('n', '<leader>ps', function()
      builtin.live_grep({
        additional_args = function() return { "--hidden", "--no-ignore" } end,
      })
    end, { desc = 'Telescope live grep' })

    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = 'Grep word under cursor' })
  end,
}

