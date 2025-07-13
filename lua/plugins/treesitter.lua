return {
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "lua", "python", "c", "cpp", "rust", "java"}, -- Add your languages here
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

