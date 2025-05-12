local dap = require("dap")
local dapui = require("dapui")

local bufmap = function(keys, func)
  vim.keymap.set('n', keys, func, { buffer = bufnr })
end

bufmap('<leader>dc', dap.continue)
bufmap('<leader>dn', dap.step_over)
bufmap('<leader>ds', dap.step_into)
bufmap('<leader>do', dap.step_out)
bufmap('<leader>db', dap.set_breakpoint)
bufmap('<leader>dB', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
bufmap('<leader>dr', dap.repl.open)
bufmap('<leader>dl', dap.run_last)

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require('mason-nvim-dap').setup({
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      require('mason-nvim-dap').default_setup(config)
    end,
  },
})
