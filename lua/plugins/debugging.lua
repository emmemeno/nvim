return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },

    config = function()

        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

        dap.configurations.rust = {
            {
            name = "Debug with codelddb",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ',
                vim.fn.getcwd() .. '\\target\\debug\\'..
                vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. '.exe',
                'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            },
        }
        dap.adapters.codelldb = {
            type = 'server',
            port = "13000",
            executable = {
                -- CHANGE THIS to your path!
                command = 'd:/dev/codelldb/extension/adapter/codelldb',
                args = {"--port", "13000"},

                -- On windows you may have to uncomment this:
                 detached = false,
          }
        }

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

        vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<Leader>dc', dap.continue, {})
    end

}
