return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "html", "cssls", "jdtls" },
    })

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr }
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
      map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
    end

    -- Use blink.cmp capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Define server configs using the new API
    local servers = { "lua_ls", "pyright", "rust_analyzer", "html", "cssls" }

    for _, server in ipairs(servers) do
      vim.lsp.config[server] = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Start LSP client using new setup
      vim.lsp.start(vim.lsp.config[server])
    end
  end,
}

