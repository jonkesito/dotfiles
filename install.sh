#!/bin/bash

# Mensaje estético inicial
echo "🚀 Iniciando el despliegue de tus Dotfiles (Estructura Plana)..."

# Definir la ruta actual del repositorio
DOTFILES_DIR="$HOME/dotfiles"

# 1. Asegurar que la carpeta .config del sistema exista
mkdir -p "$HOME/.config"

# 2. Vincular archivos sueltos de la raíz del usuario
echo "🔗 Vinculando archivos base de Zsh..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# 3. Vincular WezTerm (Desde tu raíz hacia .config/wezterm)
echo "🔗 Vinculando entorno de WezTerm..."
rm -rf "$HOME/.config/wezterm"  # Limpia accesos viejos si existen
ln -sf "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"

# 4. Vincular Neovim (Desde tu raíz hacia .config/nvim)
echo "🔗 Vinculando entorno de Neovim..."
rm -rf "$HOME/.config/nvim"     # Limpia accesos viejos si existen
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "🔗 Vinculando entorno de Ghostty..."
rm -rf "$HOME/.config/ghostty"
ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

echo "✅ ¡Enlaces simbólicos creados con éxito en tu sistema!"
echo "💡 Al reiniciar la terminal, tus temas y configuraciones estarán activos."
