# --- Historial ---
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# --- Plugins (Arch Linux Paths) ---
# Autocompletado gris (como pez)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Resaltado de sintaxis (verde si está bien, rojo si está mal)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Alias (Atajos útiles) ---
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias rmdependencies='sudo pacman -Rns $(pacman -Qtdq)'

# Alias para que ls use colores
alias ls='ls --color=auto'

# --- ALIAS DE UTILIDAD ---
alias seeupdates='firefox https://archlinux.org/news/'

# --- CARGO ALIAS
alias cr='cargo run'
alias cb='cargo build'
alias cch='cargo check'
alias cbr='cargo build --release'

# --- CARGO FUNCTIONS
cn() {
    cargo new "$1" && cd "$1"
}

# --- MEJORAS ---

# 1. Zoxide (Reemplazo inteligente de cd)
eval "$(zoxide init zsh)"
alias cd='z'

# 2. Eza (Reemplazo de ls con iconos y git)
# Sobrescribimos los alias anteriores
alias ls='eza --icons --git'
alias ll='eza -l --icons --git --group-directories-first'
alias la='eza -la --icons --git --group-directories-first'
alias tree='eza --tree --icons'

# 3. Bat (Reemplazo de cat con colores)
alias cat='bat --theme=Nord'
# Ayuda coloreada (ej: help ls)
alias help='bat --plain --language=help'

# 4. FZF (Buscador e Historial)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Ctrl+R buscará en tu historial de forma visual
# Ctrl+T buscará archivos

fastfetch

eval "$(starship init zsh)"
