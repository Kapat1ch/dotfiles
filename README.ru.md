<div align="center">

# 🌙 Minimalist Moon Dotfiles

<p align="center">
  <b>Nobara Linux • GNOME • Ptyxis • Чистый Bash • Модульный Neovim</b>
</p>

[🇬🇧 Read in English](README.md)

---

### 📸 Скриншоты

<img src="./img/desktop.jpg" alt="Рабочий стол" width="85%">
<br><br>
<img src="./img/terminal.png" alt="Терминал" width="49%">
<img src="./img/fastfetch.png" alt="Fastfetch" width="49%">
<br><br>
<img src="./img/nvim.png" alt="Дашборд Neovim" width="85%">
<br><br>
<img src="./img/btop.png" alt="btop" width="85%">

</div>

---

## 💻 Спеки и окружение
- **ОС:** Nobara Linux 44 (GNOME Edition)
- **Композитор:** Mutter (Wayland)
- **Терминал:** Ptyxis
- **Оболочка:** Bash (кастомный двустрочный промпт на чистом Bash)
- **Редактор:** Neovim (модульная сборка с нуля на базе `lazy.nvim`)
- **Утилиты:** `fastfetch`, `eza`, `btop`
- **Шрифт:** Hack Nerd Font
- **Цветовая палитра:** Tokyo Night / Moon Monochrome

## 📂 Что внутри
* **`.bashrc`** — Легковесный промпт на чистом Bash с TrueColor цветами:
  * Наглядный код ошибки при падении команды (`× 127`, `× 1` и т.д.)
  * Статус Git (ветка и маркер изменений `*`)
  * Автоопределение пакетного менеджера проекта (`pnpm`, `npm`, `yarn`)
  * Удобные алиасы с иконками через `eza`
* **`.config/nvim/`** — Чистая модульная архитектура Neovim:
  * Менеджер плагинов: `lazy.nvim`
  * Интерфейс: кастомный арт в `alpha-nvim`, файловый менеджер `neo-tree`, `lualine`, `noice.nvim`
  * Разработка: LSP (`mason`), подсветка `treesitter`, автодополнение кода, форматирование
* **`.config/fastfetch/`** — Кастомный блок с характеристиками ПК и скругленными рамками.
* **`.config/btop/`** — Конфиг системного монитора с темой в цветах остальной сборки.
* **`install.sh`** — Ставит Hack Nerd Font и Node.js (через nvm) в домашнюю папку, затем делает симлинки конфигов в `~` (старые файлы сохраняются в бэкап).

## 📦 Рекомендуемые пакеты

| Инструмент | Для чего | Установка |
|---|---|---|
| Neovim 0.10+ | редактор (лучше 0.11+) | [гайд](https://github.com/neovim/neovim/blob/master/INSTALL.md) |
| `eza` | замена `ls` с иконками | [гайд](https://github.com/eza-community/eza/blob/main/INSTALL.md) |
| `fastfetch` | информация о системе | [гайд](https://github.com/fastfetch-cli/fastfetch#installation) |
| `btop` | системный монитор | [гайд](https://github.com/aristocratos/btop#installation) |
| `ripgrep`, `fd` | поиск файлов и текста в Telescope | [ripgrep](https://github.com/BurntSushi/ripgrep#installation) |
| `wl-clipboard` | системный буфер обмена в Neovim на Wayland (на X11 нужен `xclip`) | |
| `gcc`, `g++`, `make`, `unzip`, `curl`, `tar`, `git` | сборка парсеров Treesitter, Mason | |
| Node.js (через nvm) | LSP-серверы (Mason), `prettier` | [nvm](https://github.com/nvm-sh/nvm#installing-and-updating) |
| Hack Nerd Font | иконки в терминале и Neovim | [скачать](https://www.nerdfonts.com/font-downloads) |

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
> В старых релизах `eza` и `fastfetch` могут отсутствовать в репозиториях, а Neovim в пакетах может быть старше 0.10. Смотри гайды выше.

Hack Nerd Font есть в репозиториях только у некоторых дистрибутивов (например, `ttf-hack-nerd` в Arch). В остальных случаях скачай `Hack.zip` из релизов Nerd Fonts, распакуй в `~/.local/share/fonts/` и выполни `fc-cache -f`.

## 🚀 Установка
```bash
git clone https://github.com/Kapat1ch/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Сначала поставь пакеты из раздела выше. Скрипт не устанавливает системные пакеты и не требует `sudo`, он работает только в домашней папке.

Опции: `--skip-font`, `--skip-node`. После установки выбери **Hack Nerd Font** в настройках терминала, иначе иконки будут пустыми квадратами.
