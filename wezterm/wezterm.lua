-- ==============================================================================
-- 🚀 MI CONFIGURACIÓN ULTRA OPTIMIZADA DE WEZTERM (LUA)
-- ==============================================================================
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 🎨 ESQUEMA DE COLORES (Combina perfecto con Catppuccin)
config.color_scheme = "Catppuccin Mocha"

-- 🔤 TIPOGRAFÍA (La que instalamos antes)
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 19.0

config.background = {
	{
		-- 1. Capa inferior: Fondo completamente negro para rellenar los lados
		source = { Color = "#000000" },
		width = "100%",
		height = "100%",
	},
	{
		-- 2.  Capa superior: Tu imagen centrada sin estirarse
		source = { File = "/home/JonkiSnow/Pictures/waifubot.jpg" },
		vertical_align = "Middle",
		horizontal_align = "Center",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",

		-- Ajuste visual obligatorio: "Contain" escala la imagen sin recortarla
		height = "Contain",
		width = "Contain",

		-- Opcional: Dale opacidad a la imagen para que las letras se lean mejor
		opacity = 0.2,
	},
}

-- 🪟 DETALLES VISUALES DE LA VENTANA
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 15,
}
config.hide_tab_bar_if_only_one_tab = false -- Oculta la barra si solo tienes una pestaña activa

-- ⌨️ ATAJOS DE TECLADO TRADICIONALES (Copiado y pegado rápido)
config.keys = {
	{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
}

return config
