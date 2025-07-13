return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function()
    require("typescript-tools").setup({
      on_attach = function(client, bufnr)
        -- Optional keymaps here
        local opts = { buffer = bufnr }
        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = "all",
        tsserver_plugins = {},
      },
    })
  end,
}

