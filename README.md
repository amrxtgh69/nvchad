# NvChad Configuration

Personal Neovim config built on [NvChad](https://github.com/NvChad/NvChad).

## Keybindings

### Navigation
| Key | Action |
|-----|--------|
| `Tab` / `Shift+Tab` | Next/previous buffer |
| `s` / `S` | Hop forward/backward to character |
| `t` / `T` | Hop till character (before/after cursor) |
| `n` / `N` | Next/prev search result (centered) |
| `Ctrl+u` / `Ctrl+d` | Half page up/down (centered) |

### Files & Buffers
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader><space>` | Telescope buffers |
| `<leader>fg` | Grep in current file |
| `<leader>a` | Harpoon: add file |
| `<leader>o` | Harpoon: quick menu |
| `<leader>1-4` | Harpoon: navigate to file 1-4 |

### Development
| Key | Action |
|-----|--------|
| `<leader>cc` | Cargo run |
| `<leader>cr` | Rustc compile & run |
| `<leader>pc` | Python run |
| `<leader>gp` | G++ compile & run |
| `<leader>gc` | GCC compile & run |
| `<leader>gg` | LazyGit |

### Editor
| Key | Action |
|-----|--------|
| `<leader>u` | UndoTree toggle |
| `<leader>cx` | Make file executable |
| `<leader>sd` | Vertical split |
| `<leader>st` | Terminal in vertical split |

### Clipboard
| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>d` | Delete without yanking |
| `<leader>p` | Paste over (visual mode) |
| `Ctrl+Shift+C/V` | System copy/paste |

## Plugins

| Plugin | Purpose |
|--------|---------|
| nvterm | Integrated terminal |
| harpoon | Quick file switching |
| hop.nvim | Fast navigation (`s` key) |
| conform.nvim | Code formatting |
| undotree | Visual undo history |
| lazygit | Git integration |

## UI Settings

- **Theme**: `rosepine` with `one_light` toggle
- **Statusline**: VSCode colored with block separators
- **Telescope**: Borderless style
- **Dashboard**: Load on startup with quick actions
- **Terminal**: 30% height horizontal, 45% width vertical

## Options

- Line numbers enabled, relative disabled
- System clipboard integration
- 5-line scroll offset
- No line wrap
- Incremental search, no highlight search

## Neovide (GUI)

- JetBrainsMono font at 11pt
- 95% opacity
- Cursor animation (0.2s)
- Scroll animation (0.3s)
- 60Hz refresh rate

## Language Support

**LSP/Treesitter**: Lua, Bash, Python, Rust, C, C++, JavaScript, TypeScript, HTML, CSS, JSON, YAML, Markdown, Go

**Formatters**: `stylua` (Lua), `prettier` (HTML/CSS)

## Structure

```
nvchad/lua/
├── mappings.lua       # Keybindings
├── chadrc.lua         # UI/theme config
├── options.lua        # Neovim options
├── autocmds.lua       # Autocommands
├── plugins/init.lua   # Plugin specs
└── configs/           # Plugin configs
    ├── conform.lua    # Formatter setup
    ├── harpoon.lua    # Harpoon keys
    ├── hop.lua        # Hop navigation
    ├── lspconfig.lua  # LSP setup
    └── undotree.lua   # UndoTree config
```

## Install

```bash
git clone https://github.com/yourusername/nvchad ~/.config/nvim
nvim
```

## Requirements

- Neovim 0.10+
- ripgrep (live grep)
- LazyGit (optional)
