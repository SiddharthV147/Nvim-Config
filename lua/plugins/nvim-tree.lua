
-- Make sure lazy.nvim / packer.nvim / whatever you use loads nvim-tree
-- Example for lazy.nvim
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      disable_netrw = false, -- do NOT disable netrw
      hijack_netrw = false,  -- do NOT hijack netrw windows
      -- open_on_setup = false, -- do NOT open tree on startup
      -- open_on_setup_file = false,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      view = {
        width = 30,
        side = "left",
      },
    })

    -- Set keymap for toggle
    vim.keymap.set('n', '<C-/>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
