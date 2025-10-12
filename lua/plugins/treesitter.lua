-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("nvim-treesitter not found", vim.log.levels.ERROR)
        return
      end

      configs.setup({
        ensure_installed = {
          "lua",
          "python",
          "c",
          "cpp",
          "rust",
          "java",
          "html",
          "css",
          "bash",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Optional useful extensions
  -- { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPost" },
  -- { "windwp/nvim-ts-autotag", event = "InsertEnter" },
}

