return {
  
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    lazy = false,
    config = function()
      local protocol = vim.lsp.protocol
      local capabilities = protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = { "pyright", "lua_ls", "clangd", "rust_analyzer" }
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })
      vim.lsp.config('clangd', {
        capabilities = capabilities
      })
      vim.lsp.config('pyright', {
        capabilities = capabilities
      })
      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities
      })

      vim.diagnostic.enable = true
      vim.diagnostic.config({
        virtual_lines = true,
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
