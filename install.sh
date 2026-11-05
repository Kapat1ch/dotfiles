#!/usr/bin/env bash
# Minimalist Moon Dotfiles installer (Nobara / Fedora)
# Usage: ./install.sh [--skip-font] [--skip-node]
# System packages are NOT installed here, see the README. This script only touches $HOME.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
FONT_DIR="$HOME/.local/share/fonts/HackNerdFont"
NVM_VERSION="v0.41.0"

SKIP_FONT=0
SKIP_NODE=0
for arg in "$@"; do
  case "$arg" in
    --skip-font)     SKIP_FONT=1 ;;
    --skip-node)     SKIP_NODE=1 ;;
    -h|--help)
      echo "Usage: ./install.sh [--skip-font] [--skip-node]"
      exit 0
      ;;
    *) echo "Unknown option: $arg" >&2; exit 1 ;;
  esac
done

info() { printf '\033[1;36m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*"; }

check_deps() {
  local missing=()
  local cmd
  for cmd in git nvim curl unzip fc-cache; do
    command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
  done
  if (( ${#missing[@]} > 0 )); then
    warn "Missing: ${missing[*]}"
    warn "Install the packages listed in the README first, then run ./install.sh again."
    exit 1
  fi
}

install_font() {
  if [[ -n "$(fc-list | grep -i 'Hack Nerd Font' || true)" ]]; then
    info "Hack Nerd Font is already installed"
    return
  fi
  info "Installing Hack Nerd Font"
  local tmp
  tmp="$(mktemp -d)"
  curl -fL -o "$tmp/Hack.zip" \
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
  mkdir -p "$FONT_DIR"
  unzip -oq "$tmp/Hack.zip" -d "$FONT_DIR"
  rm -rf "$tmp"
  fc-cache -f
}

install_node() {
  export NVM_DIR="$HOME/.nvm"
  if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
    info "Installing nvm $NVM_VERSION"
    # PROFILE=/dev/null: the repo's .bashrc already loads nvm, so don't let the installer edit it
    curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | PROFILE=/dev/null bash
  fi
  # nvm.sh is not compatible with `set -u`
  set +u
  # shellcheck disable=SC1091
  . "$NVM_DIR/nvm.sh"
  if ! command -v node >/dev/null 2>&1; then
    info "Installing Node.js LTS"
    nvm install --lts
  else
    info "Node.js is already installed"
  fi
  if ! command -v prettier >/dev/null 2>&1; then
    info "Installing prettier (used by conform.nvim)"
    npm install -g prettier
  fi
  set -u
}

sync_nvim() {
  if ! command -v nvim >/dev/null 2>&1; then
    warn "nvim not found, skipping plugin sync"
    return
  fi
  info "Syncing Neovim plugins (lazy.nvim)"
  nvim --headless "+Lazy! sync" +qa || warn "Plugin sync failed, run :Lazy sync inside nvim"
}

link() {
  local rel="$1"
  local src="$DOTFILES/$rel"
  local dst="$HOME/$rel"

  if [[ ! -e "$src" ]]; then
    warn "Skipping $rel (not found in repo)"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
    info "$rel is already linked"
    return
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    mkdir -p "$BACKUP/$(dirname "$rel")"
    mv "$dst" "$BACKUP/$rel"
    info "Backed up old $rel to $BACKUP"
  fi

  ln -s "$src" "$dst"
  info "Linked $rel"
}

check_deps
[[ $SKIP_FONT -eq 1 ]]     || install_font
[[ $SKIP_NODE -eq 1 ]]     || install_node

link ".bashrc"
link ".config/nvim"
link ".config/fastfetch"
link ".config/btop"

sync_nvim

echo
info "Done."
echo "  - Pick 'Hack Nerd Font' in Ptyxis: Preferences -> Font"
echo "  - Open a new terminal (or run: source ~/.bashrc)"
echo "  - First nvim launch installs LSP servers via mason (needs internet, takes a minute)"
echo "  - For Lua formatting run inside nvim: :MasonInstall stylua"
