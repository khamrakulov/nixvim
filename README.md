# ✨ xfeusw's Nixvim Configuration

This is a personal Neovim configuration written using **Nix Flakes** and powered by [nixvim](https://github.com/nix-community/nixvim). It provides a modern, modular, and reproducible setup for Neovim, leveraging the power of the Nix ecosystem.

---

## 🚀 Installation

You can use this configuration in several ways:

### 🔁 Method 1: Standalone with `nix develop`

```bash
git clone github:khamrakulov/nixvim
cd nixvim
nix develop
```

Once inside the `nix develop` environment, just run:

```bash
nvim
```

### ⚡ Method 2: Direct installation with `nix profile`

```bash
nix profile install github:khamrakulov/nixvim
# or local path:
nix profile install path:/path/to/nixvim-config
```

### 🏠 Method 3: Home Manager Integration (Recommended)

Add this flake as an input to your home-manager configuration:

```nix
# In your main flake.nix
inputs = {
  nixvim-config.url = "github:khamrakulov/nixvim";
  # or local: nixvim-config.url = "path:./nixvim-config";
};

# In your home.nix
home.packages = [
  nixvim-config.packages.x86_64-linux.default
];
```

---

## 🔌 Plugins & Keymaps

Here is a list of the main plugins included in this configuration:

### 📁 **Core Plugins**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`snacks.picker`](https://github.com/folke/snacks.nvim) | File/symbol search | `<leader>ff`, `<leader>fb`, `<leader>gl`, `<leader>gs` |
| [`snacks.explorer`](https://github.com/folke/snacks.nvim) | File explorer | `<leader>e` |
| [`blink-cmp`](https://github.com/Saghen/blink.cmp) | Code completion | `<Tab>`, `<S-Tab>`, `<CR>`, `<C-space>` |
| [`aerial.nvim`](https://github.com/stevearc/aerial.nvim) | Symbol outline | `<leader>o` |

### 🎨 **UI & Navigation**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`bufferline.nvim`](https://github.com/akinsho/bufferline.nvim) | Buffer tabs | `<S-h>`, `<S-l>`, `<leader>bd`, `<leader>bo` |
| [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) | Status line | Auto-configured |
| [`catppuccin.nvim`](https://github.com/catppuccin/nvim) | Color scheme | `<leader>uC` |
| [`dashboard.nvim`](https://github.com/nvimdev/dashboard-nvim) | Start screen | Auto-configured |
| [`barbecue.nvim`](https://github.com/utilyre/barbecue.nvim) | Breadcrumbs | Auto-configured |

### 🔧 **Development Tools**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim) | Terminal | `<C-t>` |
| [`lazygit.nvim`](https://github.com/kdheepak/lazygit.nvim) | Git interface | `<leader>gg` |
| [`kulala.nvim`](https://github.com/mistweaverco/kulala.nvim) | HTTP client | `<leader>Rs`, `<leader>Ra`, `<leader>Rb` |
| [`nix-develop.nvim`](https://github.com/figsoda/nix-develop.nvim) | Nix development | `<leader>nd` |

### 🎯 **Editor Enhancements**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`auto-save.nvim`](https://github.com/pocco81/auto-save.nvim) | Auto save | `<C-s>` (toggle) |
| [`yanky.nvim`](https://github.com/gbprod/yanky.nvim) | Yank history | `<leader>p` |
| [`zen-mode.nvim`](https://github.com/folke/zen-mode.nvim) | Focus mode | `<leader>zm` |
| [`treesj.nvim`](https://github.com/Wansmer/treesj) | Split/join code | `<leader>m`, `<leader>s`, `<leader>j` |
| [`yazi.nvim`](https://github.com/mikavilpas/yazi.nvim) | File manager | `<leader>fm` |

### 🎪 **Visual Effects**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`smear-cursor.nvim`](https://github.com/sphamba/smear-cursor.nvim) | Cursor animations | Auto-configured |
| [`neoscroll.nvim`](https://github.com/karb94/neoscroll.nvim) | Smooth scrolling | Auto-configured |
| [`hlchunk.nvim`](https://github.com/shellRaining/hlchunk.nvim) | Highlight chunks | Auto-configured |
| [`noice.nvim`](https://github.com/folke/noice.nvim) | UI messages | Auto-configured |

### 📝 **Language Support**

| Plugin Name | Purpose | Key Mappings |
|-------------|---------|--------------|
| [`treesitter.nvim`](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting | Auto-configured |
| [`markview.nvim`](https://github.com/OXY2DEV/markview.nvim) | Markdown rendering | Auto-configured |
| [`ts-comments.nvim`](https://github.com/folke/ts-comments.nvim) | Smart comments | Auto-configured |

---

## 📦 Flake Structure

```text
nixvim/
├── flake.nix              # Main flake configuration
├── flake.lock             # Locked dependencies
├── config/
│   ├── default.nix        # Main configuration entry point
│   ├── keymaps.nix        # Global keymaps
│   ├── themes.nix         # Color schemes
│   ├── lsp/
│   │   ├── lsp.nix        # LSP configuration
│   │   ├── conform.nix    # Code formatting
│   │   └── fidget.nix     # LSP progress UI
│   ├── aerial.nix         # Symbol outline
│   ├── autopairs.nix      # Auto-pairing brackets
│   ├── autosave.nix       # Auto-save functionality
│   ├── barbecue.nix       # Breadcrumbs
│   ├── blink-cmp.nix      # Completion engine
│   ├── bufferline.nix     # Buffer tabs
│   ├── dashboard.nix      # Start screen
│   ├── gitsigns.nix       # Git integration
│   ├── hlchunk.nvim       # Chunk highlighting
│   ├── kulala.nix         # HTTP client
│   ├── lazygit.nix        # Git interface
│   ├── lualine.nix        # Status line
│   ├── markview.nix       # Markdown rendering
│   ├── neoscroll.nix      # Smooth scrolling
│   ├── nix-develop.nix    # Nix development
│   ├── noice.nix          # UI messages
│   ├── notify.nix         # Notifications
│   ├── smear-cursor.nix   # Cursor animations
│   ├── snacks.nix         # File picker & explorer
│   ├── timerly.nix        # Timer functionality
│   ├── tmux-navigator.nix # Tmux integration
│   ├── toggleterm.nix     # Terminal
│   ├── treesitter.nix     # Syntax highlighting
│   ├── treesj.nix         # Split/join code
│   ├── ts-comments.nix    # Smart comments
│   ├── web-devicons.nix   # File icons
│   ├── whichkey.nix       # Keymap helper
│   ├── wtf.nix            # Error explanations
│   ├── yanky.nix          # Yank history
│   ├── yazi.nix           # File manager
│   └── zen-mode.nix       # Focus mode
└── README.md              # This file
```

---

## 🧠 Notes

- The `config/default.nix` is the entry point that imports all plugin configurations
- Each plugin has its own dedicated `.nix` file for better organization
- Compatible with Linux, macOS, and WSL
- All LSP servers, formatters, and tools are managed through Nix
- Transparent background is enabled by default in the Catppuccin theme
- Development shell includes .NET SDK and ASP.NET Core for C# development

---

## 🔧 Customization

To customize this configuration:

1. Fork or copy this repository
2. Modify the plugin configurations in the `config/` directory
3. Add new plugins by creating new `.nix` files and importing them in `config/default.nix`
4. Update the `extraPackages` in `config/default.nix` to include additional tools

---

## 📫 Contact

Feel free to open issues or submit pull requests for improvements!

Repository: [github.com/khamrakulov/nixvim](https://github.com/khamrakulov/nixvim)

---
