return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "Weissle/persistent-breakpoints.nvim",
    "Carcuis/dap-breakpoints.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()
    require("dap-go").setup()
    require("persistent-breakpoints").setup()
    require("dap-breakpoints").setup({
      virtual_text = {
        layout = {
          position = "eol",
        },
        prefix = {
          log_point = " ",
          conditional = " ",
          hit_condition = "󰰁 ",
        }
      }
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#f9e2af" })
    vim.fn.sign_define('DapBreakpoint',           { text='',  texthl='DapBreakpoint',  linehl='DapBreakpoint',  numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',  { text='',  texthl='DapBreakpoint',  linehl='DapBreakpoint',  numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected',   { text='',  texthl='DapBreakpoint',  linehl='DapBreakpoint',  numhl='DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint',             { text='',  texthl='DapLogPoint',    linehl='DapLogPoint',    numhl='DapLogPoint'   })
    vim.fn.sign_define('DapStopped',              { text='',  texthl='DapStopped',     linehl='DapStopped',     numhl='DapStopped'    })

    vim.keymap.set("n",  "<Leader>du",  dapui.open,                           { desc = "Debugger Open UI" })
    vim.keymap.set("n",  "<Leader>dU",  dapui.close,                          { desc = "Debugger Close UI" })
    vim.keymap.set("n",  "<Leader>db",  dap.toggle_breakpoint,                { desc = "Debugger Toggle Breakpoint" })
    vim.keymap.set("n",  "<Leader>dB",  "<CMD>DapBpSetConditionalPoint<CR>",  { desc = "Debugger Set Conditional Breakpoint" })
    vim.keymap.set("n",  "<Leader>dl",  "<CMD>DapBpSetLogPoint<CR>",          { desc = "Debugger Set Log Point" })
    vim.keymap.set("n",  "<Leader>de",  "<CMD>DapBpEdit<CR>",                 { desc = "Debugger Edit Breakpoint" })
    vim.keymap.set("n",  "<Leader>dp",  dap.pause,                            { desc = "Debugger Pause" })
    vim.keymap.set("n",  "<Leader>dc",  dap.continue,                         { desc = "Debugger Continue" })
    vim.keymap.set("n",  "<Leader>di",  dap.step_into,                        { desc = "Debugger Step Into" })
    vim.keymap.set("n",  "<Leader>do",  dap.step_over,                        { desc = "Debugger Step Over" })
    vim.keymap.set("n",  "<Leader>dO",  dap.step_out,                         { desc = "Debugger Step Out" })
  end,
}
