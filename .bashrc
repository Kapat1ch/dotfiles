# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'

PROMPT_DIRTRIM=2

prompt_structured() {
    local exit_code=$?
    local RESET="\[\e[0m\]"
    local C_BORDER="\[\e[38;2;65;72;104m\]"    
    local C_SEP="${C_BORDER}│${RESET}"
    local C_OS="\[\e[38;2;125;207;255m\]"
    local C_DIR="\[\e[38;2;122;162;247m\]"
    local C_GIT="\[\e[38;2;187;154;247m\]" 
    local C_PKG="\[\e[38;2;247;118;142m\]"

    local arrow="\[\e[38;2;158;206;106m\]❯${RESET}"
    [ $exit_code -ne 0 ] && arrow="\[\e[38;2;247;118;142m\]❯${RESET}"

    # Git блок
    local git_part=""
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local dirty=""
        [ -n "$(git status --porcelain 2>/dev/null)" ] && dirty="*"
        git_part=" ${C_SEP} ${C_GIT} ${branch}${dirty}${RESET}"
    fi

    # Стек проекта
    local pkg_part=""
    if [ -f "pnpm-lock.yaml" ]; then
        pkg_part=" ${C_SEP} ${C_PKG}󰚥 pnpm${RESET}"
    elif [ -f "package-lock.json" ]; then
        pkg_part=" ${C_SEP} ${C_PKG} npm${RESET}"
    elif [ -f "yarn.lock" ]; then
        pkg_part=" ${C_SEP} ${C_PKG} yarn${RESET}"
    fi

    local err_part=""
    [ $exit_code -ne 0 ] && err_part=" ${C_SEP} \[\e[38;2;247;118;142m\] ${exit_code}${RESET}"

    PS1="\n${C_BORDER}╭─ ${C_OS} nobara ${C_SEP} ${C_DIR} \w${RESET}${git_part}${pkg_part}${err_part}\n${C_BORDER}╰─${arrow} "
}
PROMPT_COMMAND=prompt_structured
