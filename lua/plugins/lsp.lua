local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    buffer = bufnr,
    callback = function(_)
      vim.lsp.buf.format({ async = false, bufnr = bufnr })
    end,
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup {
  automatic_enable = {
    exclude = {}
  },
  ensure_installed = { 'lua_ls', 'neocmake' }
}

local lsp_config = vim.lsp.config

lsp_config('*', {
  on_attach = on_attach,
  capabilities = capabilities
})

lsp_config.lua_ls = {
  on_attach = function()
    require('neodev').setup()
    on_attach(unpack(arg))
  end,
  filetypes = { 'lua' },
  capabilities = capabilities,
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
}

lsp_config.clangd = {
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp_config.neocmake = {
  filetypes = { 'cmake', 'CMakeLists.txt' },
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp_config.rust_analyzer = {
  checkOnSave = { command = "cargo check" },
  on_attach = on_attach,
  enable = true,
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  capabilities = capabilities,
}
