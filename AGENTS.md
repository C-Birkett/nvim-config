# AGENTS.md - Neovim Configuration Guide

This document provides guidelines for AI coding agents working in this Neovim configuration repository.

## Project Overview

**Type:** Personal Neovim configuration  
**Language:** Lua (100%)  
**Package Manager:** lazy.nvim  
**Repository:** https://github.com/C-Birkett/nvim-config

This is a modern Neovim configuration with LSP support, completion, debugging, AI assistance (opencode.nvim), 
and comprehensive keybindings. The configuration is platform-aware (Windows/Linux) and uses a modular plugin system.

## Commands

### Running Neovim
```bash
# Neovim loads config automatically from this directory
nvim

# Check configuration health
nvim -c checkhealth
```

### Plugin Management (within Neovim)
```bash
:Lazy                 # Open plugin manager UI
:Lazy sync            # Update and install plugins
:Lazy clean           # Remove unused plugins
:Lazy update          # Update all plugins
```

### LSP & Tool Management (within Neovim)
```bash
:Mason                # Open LSP/tool installer
:MasonUpdate          # Update Mason registry
:LspInfo              # Show LSP server status
:LspRestart           # Restart LSP servers
```

### Testing & Validation
There are no automated tests for this configuration. Validation is done through:
```bash
:checkhealth          # Comprehensive health check
:checkhealth lazy     # Check plugin manager
:checkhealth lsp      # Check LSP configuration
:checkhealth mason    # Check tool installations
:checkhealth opencode # Check opencode.nvim setup
```

### Git Operations
Standard git commands apply. Recent workflow:
```bash
git status
git add .
git commit -m "Brief description of changes"
git push
```

## Project Structure

```
C:\Users\conan.birkett\AppData\Local\nvim\
├── init.lua                    # Entry point - loads platform configs, sets vim options, bootstraps lazy.nvim
├── lazy-lock.json              # Plugin version lockfile (35 plugins)
├── .gitignore                  # Ignores: autoload, texlab, lazy-lock.json, machine_local.lua
└── lua/
    ├── globals.lua             # Global flags (USE_COPILOT, IS_WINDOWS, IS_LINUX)
    ├── macros.lua              # Keybindings and which-key groups (~40 keymaps)
    ├── plugins.lua             # Empty (returns {})
    ├── platform/
    │   ├── windows.lua        # Windows-specific paths (Python, Node)
    │   └── linux.lua          # Linux-specific settings (TODO)
    └── plugins/               # Modular plugin configurations
        ├── ai.lua             # opencode.nvim AI assistant integration
        ├── completion.lua     # nvim-cmp setup with LSP and snippet sources
        ├── copilot.lua        # GitHub Copilot (completion source only, commented out)
        ├── debug.lua          # nvim-dap for debugging (Godot support)
        ├── git.lua            # Neogit and Gitsigns
        ├── lsp_config.lua     # Mason + LSP servers (clangd, csharp_ls, lua_ls, pyright, ts_ls, powershell_es)
        ├── neo-tree.lua       # File explorer
        ├── none_ls.lua        # Formatter/linter bridge (none-ls, formerly null-ls)
        ├── telescope.lua      # Fuzzy finder
        ├── treesitter.lua     # Syntax highlighting
        ├── vimwiki.lua        # Personal wiki
        ├── visual.lua         # UI/theme (Nord theme, lualine, startify)
        └── which-key.lua      # Keybinding helper
```

## Code Style Guidelines

### File Organization
- **One plugin per file** in `lua/plugins/` directory
- **Platform-specific code** goes in `lua/platform/{windows,linux}.lua`
- **Global configuration** in `lua/globals.lua`
- **All keybindings** centralized in `lua/macros.lua`

### Lua Conventions

#### Indentation & Formatting
```lua
-- 4 spaces for indentation (never tabs)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Function definitions
function example()
    -- body
end

-- Or anonymous
local fn = function()
    -- body
end
```

#### Naming Conventions
```lua
-- snake_case for variables and functions
local my_variable = "value"
local function my_function()
end

-- snake_case for filenames
-- lua/plugins/lsp_config.lua (not lspConfig.lua or LSPConfig.lua)

-- UPPER_SNAKE_CASE for globals and constants
globals.USE_COPILOT = false
globals.IS_WINDOWS = true
```

#### String Handling
```lua
-- Mixed quotes are acceptable, prefer double quotes for consistency
local path = "C:\\Users\\example"
local name = 'nvim-lspconfig'

-- Use string.format for complex strings
local msg = string.format("The user works on a %s machine", vim.loop.os_uname().sysname)
```

#### Tables & Plugin Specs
```lua
-- Plugin spec structure (lazy.nvim format)
return {
    {
        'plugin/name',
        dependencies = {
            'other/plugin',
        },
        lazy = false,  -- or event = { "BufReadPre", "BufNewFile" }
        config = function()
            require("plugin").setup({
                option = value,
            })
        end
    },
}

-- Trailing commas are standard
local sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },  -- trailing comma OK
}
```

#### Imports & Requires
```lua
-- Imports at top of file
local globals = require("globals")
local telescope = require("telescope.builtin")

-- Direct require in function calls is acceptable
require("mason").setup()

-- Conditional requires for platform-specific code
if globals.IS_WINDOWS then
    require("/platform/windows")
end
```

#### Comments
```lua
-- Single-line comments for most documentation
-- explain why, not what

-- Multi-line comments for large blocks
--[[
local old_code = function()
    -- preserved for reference
end
--]]

--- Triple-dash for function documentation (optional, not heavily used here)
```

#### Vim API Usage
```lua
-- Modern Lua API (REQUIRED)
vim.opt.number = true           -- NOT vim.o.number or vim.cmd("set number")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", function() end, { desc = "find" })

-- Avoid vimscript-style commands where Lua API exists
-- BAD:  vim.cmd("set expandtab")
-- GOOD: vim.opt.expandtab = true
```

### LSP Configuration

#### Modern LSP Setup (vim.lsp.config)
```lua
-- Use new vim.lsp.config syntax (not lspconfig[server].setup)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
})
```

#### LSP Server Installation
```lua
-- Ensure servers are added to mason-lspconfig ensure_installed list
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "csharp_ls",
        "lua_ls",
        "pyright",
        "ts_ls",
        "powershell_es",
    },
})
```

### Keybinding Conventions

```lua
-- Use descriptive names for which-key groups
wk.add({
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>a", group = "ai" },
})

-- Always include desc for leader keymaps
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "file" })

-- Use functions for complex commands
vim.keymap.set("n", "<C-n>", function() 
    vim.cmd("Neotree source=filesystem reveal=true toggle=true position=right") 
end, { desc = "neo-tree"})

-- Multi-mode keybindings for AI commands
vim.keymap.set({ "n", "x" }, "<leader>aa", function() 
    require("opencode").ask("@this: ", { submit = true }) 
end, { desc = "ask" })
```

### Error Handling & Diagnostics

```lua
-- Diagnostic configuration in init.lua
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

-- No explicit error handling - let Neovim handle errors naturally
-- Errors will appear in :messages
```

### Platform-Specific Code

```lua
-- Check platform using globals
local globals = require("globals")

if globals.IS_WINDOWS then
    vim.g.python3_host_prog = "C:\\Python312\\python.exe"
elseif globals.IS_LINUX then
    -- Linux-specific configuration
end

-- Conditional plugin loading
if globals.USE_COPILOT then
    -- AI assistant configuration (opencode.nvim)
    return {
        {
            "NickvanDyke/opencode.nvim",
            config = function()
                vim.g.opencode_opts = {
                    provider = {
                        enabled = "terminal",
                    },
                }
                vim.o.autoread = true
            end
        },
    }
else
    return {}  -- Return empty table to skip plugin
end
```

## Important Patterns

### Plugin Loading Strategy
- **lazy = false**: Load immediately (LSP, completion)
- **event = { "BufReadPre", "BufNewFile" }**: Load when opening files
- **dependencies**: Explicitly declare plugin dependencies

### Configuration Flow
1. `init.lua` loads `globals.lua` for platform detection
2. Platform-specific configs loaded from `platform/`
3. Vim options set (tabs, indent, diagnostics)
4. Lazy.nvim bootstrapped and loads plugins from `lua/plugins/`
5. `macros.lua` loaded last for keybindings

### Commented Code Policy
- Preserve commented code that may be useful later
- Keep alternative configurations visible for reference
- Use `--[[]]` for multi-line commented blocks

## Common Operations

### Adding a New LSP Server
1. Add server name to `lua/plugins/lsp_config.lua` ensure_installed
2. Add vim.lsp.config() block with capabilities
3. Restart Neovim and run `:Mason` to verify installation

### Adding a New Plugin
1. Create new file in `lua/plugins/pluginname.lua`
2. Return lazy.nvim plugin spec table
3. Run `:Lazy sync` to install

### Adding Keybindings
1. Add to `lua/macros.lua`
2. Use which-key groups for organization
3. Always include { desc = "description" }
4. Source or restart Neovim to apply

## Known Issues & Quirks

- `lazy-lock.json` is gitignored (plugin versions not tracked)
- `lua/machine_local.lua` for local overrides (gitignored)
- Linux platform config is TODO placeholder
- USE_COPILOT flag controls AI features (set per-platform in `platform/windows.lua` or `platform/linux.lua`)
- Copilot.lua completion source is available but commented out in `copilot.lua`
- opencode.nvim uses Neovim's built-in terminal provider and telescope-ui-select for pickers
- Neo-tree always opens on right side
- AI keybindings are under `<leader>a` prefix

## References

- Lazy.nvim docs: https://github.com/folke/lazy.nvim
- LSP config: https://neovim.io/doc/user/lsp.html
- Mason: https://github.com/williamboman/mason.nvim
- Which-key: https://github.com/folke/which-key.nvim
- opencode.nvim: https://github.com/nickjvandyke/opencode.nvim
