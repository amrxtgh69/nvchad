# My NvChad Configuration

A personal Neovim configuration built on [NvChad](https://github.com/NvChad/NvChad), tailored for efficient coding with a clean interface and powerful shortcuts.

![Neovim](https://img.shields.io/badge/Neovim-0.10+-green?style=flat-square&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-5.4-blue?style=flat-square&logo=lua)

## Features

### Theme & UI
- **Theme**: `ashes` (default) with `one_light` toggle
- **Statusline**: VSCode colored theme with block separators
- ** Telescope**: Borderless style
- **Transparency**: Subtle transparency effects (Neovide)

### Key Plugins
| Plugin | Purpose |
|--------|---------|
| [nvterm](https://github.com/zbirenbaum/nvterm) | Integrated terminal |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file switching |
| [hop.nvim](https://github.com/phaazon/hop.nvim) | Quick navigation (`s` key) |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [undotree](https://github.com/mbbill/undotree) | Visual undo history |
| [peek.nvim](https://github.com/toppair/peek.nvim) | Markdown preview |

### Development Shortcuts

| Keybinding | Action |
|------------|--------|
| `<leader>cc` | Run Cargo project (Rust) |
| `<leader>cr` | Compile & run Rust file |
| `<leader>pc` | Run Python file |
| `<leader>gp` | Compile & run C++ file |
| `<leader>gc` | Compile & run C file |
| `<leader>gg` | Open LazyGit |

### File Navigation
| Keybinding | Action |
|------------|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>e` | Toggle NvimTree |
| `<leader><space>` | View buffers (Telescope) |
| `<leader>fg` | Grep in current file |
| `<leader>a` | Harpoon add file |
| `<leader>o` | Harpoon quick menu |

### Editor Utilities
| Keybinding | Action |
|------------|--------|
| `s` | Hop to anywhere |
| `<leader>u` | UndoTree toggle |
| `<leader>cx` | Make file executable |
| `<C-u>` | Half page up + center |
| `<C-d>` | Half page down + center |
| `<leader>sv` | Split window vertically |

### Clipboard
| Keybinding | Action |
|------------|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>d` | Delete without yanking |
| `<leader>p` | Paste over (visual) |

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/nvchad ~/.config/nvchad

# Run setup script
chmod +x ~/nvchad/scripts/setup.sh
./scripts/setup.sh

# Start Neovim
nvim
```

Or manually:

```bash
git clone https://github.com/yourusername/nvchad ~/.config/nvim
nvim
```

## Language Support

Treesitter and LSP configured for:
- Lua, Bash, Python, Rust, C, C++
- JavaScript, TypeScript, TSX
- HTML, CSS, TailwindCSS
- Markdown, YAML, JSON
- Go, Vim, SSH config

Formatters: `stylua` (Lua), `prettier` (HTML/CSS/JS), `clang-format` (C/C++)

## Structure

```
nvchad/
├── lua/
│   ├── autocmds.lua      # Autocommand definitions
│   ├── chadrc.lua        # UI/theme configuration
│   ├── mappings.lua      # Keybindings
│   ├── options.lua       # Neovim options
│   ├── configs/          # Plugin configurations
│   │   ├── conform.lua
│   │   ├── lazy.lua
│   │   ├── lspconfig.lua
│   │   ├── overrides.lua
│   │   └── ...
│   └── plugins/
│       └── init.lua      # Plugin specifications
├── scripts/
│   └── setup.sh          # Installation script
└── .stylua.toml          # Lua formatter config
```

## Configuration

### Toggle Theme
```vim
:NvChadTheme <theme_name>
```
Built-in themes available: `ashes`, `one_light`

### Modify Settings

Edit `lua/chadrc.lua` to customize:
- Theme, transparency, integrations
- Statusline style and modules
- Telescope style
- Tabufline behavior
- Dashboard options

### Add Plugins

Edit `lua/plugins/init.lua` to add new plugins in NvChad's structure.

## Requirements

- Neovim 0.10+
- ripgrep (for live grep)
- LazyGit (optional, `<leader>gg`)
- Deno (for peek.nvim markdown preview)

## Credits

- [NvChad](https://github.com/NvChad/NvChad) - The base configuration
- All plugin authors
