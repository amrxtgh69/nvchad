# AGENTS.md - NvChad Configuration Guidelines

## Project Overview
This is a personal NvChad (Neovim configuration framework) configuration. The codebase consists of Lua configuration files for Neovim, organized following NvChad's directory structure with plugins, autocmds, mappings, and options.

## Build/Lint/Test Commands

### Formatting
```bash
stylua lua/ --check  # Check formatting without applying
stylua lua/          # Apply formatting
```

### No Test Framework
This configuration project does not have a dedicated test suite. Manual testing is done by:
- Reloading Neovim configuration: `:source %` or `:Lazy reload`
- Testing keybindings in active Neovim sessions
- Verifying plugin functionality after changes

### Installation/Setup
```bash
chmod +x ~/nvchad/scripts/setup.sh
./scripts/setup.sh
```

## Code Style Guidelines

### Imports
- Use `require` for module imports
- Use quoted module paths: `require "configs.overrides"`
- Group related imports together
- Use aliases for frequently used modules: `local map = vim.keymap.set`

### Formatting
- **Indent**: 2 spaces (configured in `.stylua.toml`)
- **Line width**: 120 characters maximum
- **Line endings**: Unix (LF)
- **Quote style**: Auto-prefer double quotes
- **Parentheses**: No parentheses in function calls without arguments
- Always run `stylua` before committing changes

### Naming Conventions
- **Variables**: `snake_case` (e.g., `local opt = vim.opt`)
- **Constants**: `SCREAMING_SNAKE_CASE` if truly constant
- **Module tables**: `M` for return tables (e.g., `local M = {}`)
- **Functions**: `snake_case` with descriptive names
- **Tables/Configuration**: Use descriptive keys with underscores
- **Keybindings**: Use descriptive `desc` field in `vim.keymap.set`

### Types
- Lua is dynamically typed; no type annotations required
- Use clear variable names to indicate expected types
- Table structures should have consistent key patterns
- Use `vim.tbl_deep_extend` for configuration merging

### Error Handling
- Use `pcall` for potentially failing operations (e.g., `local status, chadrc = pcall(require, "chadrc")`)
- Use `vim.tbl_deep_extend("force", ...)` for safe configuration merging
- Handle nil values gracefully with `and`/`or` patterns
- Check for plugin existence before configuration: `if vim.g.neovide then ... end`

### General Patterns

**Module structure:**
```lua
local M = {}

-- configuration or functions
M.option_name = { ... }

return M
```

**Plugin configuration:**
```lua
{
  "plugin/repo",
  event = "BufEnter",
  config = function()
    require "configs.pluginname"
  end,
}
```

**Keybindings:**
```lua
local map = vim.keymap.set
map("n", "<leader>key", "<cmd>command<cr>", { desc = "Description here" })
```

**Conditional execution:**
```lua
if condition then
  -- code
end
```

### Code Organization
- Keep `init.lua` minimal; delegate to specialized modules
- Use `configs/` for plugin configuration overrides
- Use `plugins/init.lua` for plugin specifications
- Group related autocmds and mappings together
- Use comments sparingly; let code be self-documenting

### NvChad Specific Patterns
- Extend base configurations with `vim.tbl_deep_extend("force", base, override)`
- Use `require "nvchad.*"` for core NvChad modules
- Follow NvChad's `chadrc.lua` structure for UI/configuration options
- Use NvChad's built-in theming and statusline configurations

### File Structure to Maintain
```
lua/
├── autocmds.lua
├── chadrc.lua          # UI/theme configuration
├── mappings.lua        # Keybindings
├── options.lua         # Neovim options
├── configs/            # Plugin configurations
│   ├── conform.lua
│   ├── lazy.lua
│   ├── lspconfig.lua
│   ├── overrides.lua   # Plugin option overrides
│   └── ...
└── plugins/
    └── init.lua        # Plugin specifications
scripts/
└── setup.sh            # Installation script
```
