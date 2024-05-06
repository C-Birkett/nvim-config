return {

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

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

            dap.adapters.godot = {
                type = "server",
                host = "127.0.0.1",
                port = 6006,
            }

            dap.configurations.gdscript = {
                {
                    launch_game_instance = false,
                    launch_scene = false,
                    name = "Launch scene",
                    project = "${workspaceFolder}",
                    request = "launch",
                    type = "godot",
                },
            }

            dap.configurations.cs = {
                {
                    launch_scene = true,
                    name = 'Launch Scene',
                    project = '${workspaceFolder}',
                    request = 'launch',
                    type = 'godot',
                },
            }
        end
    },
}
