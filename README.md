<div align="center">

# 🌙 Minimalist Moon Dotfiles

<p align="center">
  <b>Nobara Linux • GNOME • Ptyxis • Pure Bash • Modular Neovim</b>
</p>

[🇷🇺 Читать на русском](README.ru.md)

---

### 📸 Screenshots

<img src="./img/desktop.jpg" alt="Desktop Overview" width="85%">
<br><br>
<img src="./img/terminal.png" alt="Terminal" width="49%">
<img src="./img/fastfetch.png" alt="Fastfetch" width="49%">
<br><br>
<img src="./img/nvim.png" alt="Neovim Dashboard" width="85%">
<br><br>
<img src="./img/btop.png" alt="btop" width="85%">

</div>

---

## 💻 System Specifications
- **OS:** Nobara Linux 44 (GNOME Edition)
- **Compositor:** Mutter (Wayland)
- **Terminal:** Ptyxis
- **Shell:** Bash (custom prompt in pure Bash, no Starship required)
- **Editor:** Neovim (built from scratch using `lazy.nvim` with modular architecture)
- **CLI Tools:** `fastfetch`, `eza`, `btop`
- **Font:** Hack Nerd Font
- **Color Palette:** Tokyo Night / Moon Monochrome

## 📂 Repository Structure
* **`.bashrc`** — Fast, pure Bash 24-bit TrueColor prompt:
  * Exit code indicator (`× 127`, `× 1`, etc.)
  * Git branch status and dirty flag (`*`)
  * Auto-detection of package managers (`pnpm`, `npm`, `yarn`)
  * Modern aliases with `eza` icons
* **`.config/nvim/`** — Modular Neovim configuration:
  * Package manager: `lazy.nvim`
  * UI: Custom `alpha-nvim` dashboard, `neo-tree`, `lualine`, `noice.nvim`
  * Development: LSP (`mason`), `treesitter` highlighting, auto-completion, formatting
* **`.config/fastfetch/`** — Customized hardware info block with rounded borders and minimalist specs.
* **`.config/btop/`** — System monitor config with a theme matching the rest of the setup.
* **`install.sh`** — Installs Hack Nerd Font and Node.js (via nvm) into your home directory, then symlinks the configs into `~` (existing files are backed up).

## 📦 Recommended Packages

| Tool | What it's for | Install guide |
|---|---|---|
| Neovim 0.10+ | editor (0.11+ recommended) | [install](https://github.com/neovim/neovim/blob/master/INSTALL.md) |
| `eza` | `ls` replacement with icons | [install](https://github.com/eza-community/eza/blob/main/INSTALL.md) |
| `fastfetch` | system info | [install](https://github.com/fastfetch-cli/fastfetch#installation) |
| `btop` | system monitor | [install](https://github.com/aristocratos/btop#installation) |
| `ripgrep`, `fd` | file and text search in Telescope | [ripgrep](https://github.com/BurntSushi/ripgrep#installation) |
| `wl-clipboard` | system clipboard in Neovim on Wayland (`xclip` on X11) | |
| `gcc`, `g++`, `make`, `unzip`, `curl`, `tar`, `git` | building Treesitter parsers, Mason | |
| Node.js (via nvm) | LSP servers (Mason), `prettier` | [nvm](https://github.com/nvm-sh/nvm#installing-and-updating) |
| Hack Nerd Font | icons in terminal and Neovim | [download](https://www.nerdfonts.com/font-downloads) |

**Fedora / Nobara**
```bash
sudo dnf install git neovim eza fastfetch btop ripgrep fd-find wl-clipboard gcc gcc-c++ make unzip curl tar
```

**Arch**
```bash
sudo pacman -S git neovim eza fastfetch btop ripgrep fd wl-clipboard gcc make unzip curl tar ttf-hack-nerd
```

**Debian / Ubuntu**
```bash
sudo apt install git neovim btop ripgrep fd-find wl-clipboard gcc g++ make unzip curl tar
```

Hack Nerd Font is only packaged on some distros (e.g. `ttf-hack-nerd` on Arch). Otherwise download `Hack.zip` from the Nerd Fonts releases, unpack it into `~/.local/share/fonts/` and run `fc-cache -f`.

## 🚀 Quick Start
```bash
git clone https://github.com/Kapat1ch/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Install the packages from the section above first. The script doesn't install system packages and doesn't need `sudo`, it only touches your home directory.

Options: `--skip-font`, `--skip-node`. After installing, select **Hack Nerd Font** in your terminal settings, otherwise icons will show up as empty squares.
