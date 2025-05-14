local globals = {}

globals.USE_COPILOT = false
globals.IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"
globals.IS_LINUX = vim.loop.os_uname().sysname == "Linux"

return globals
