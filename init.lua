require "options"
require "lazysetup"

require "plugins.cmp"
require "plugins.lsp"
require "plugins.treesitter"
require "plugins.dap"
require "plugins.noice"

vim.cmd.colorscheme("gruvbox")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
