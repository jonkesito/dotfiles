# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Inicializar el asistente de configuración de Powerlevel10k si no existe
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi

# 1. Cargar el Gestor de Plugins (Zap)
AUTOLOAD_PLUGINS=false
source "$HOME/.local/share/zap/zap.zsh"

# 2. Lista de Plugins Esenciales (Sugerencias tipo Fish y Colores)
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# 3. Cargar el Tema Powerlevel10k
plug "romkatv/powerlevel10k"

# 4. Tus Alias y Atajos Personales (Tus comandos de Git o Vue)
alias gpsh="git push origin \$(git branch --show-current)"

# Guardar la configuración de Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
