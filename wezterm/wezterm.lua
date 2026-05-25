-- ==============================================================================
-- 🚀 MI CONFIGURACIÓN ULTRA OPTIMIZADA DE WEZTERM (LUA)
-- ==============================================================================
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 🎨 ESQUEMA DE COLORES (Combina perfecto con Catppuccin)
config.color_scheme = "Catppuccin Mocha"

-- 🔤 TIPOGRAFÍA (La que instalamos antes)
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0

-- 🖼️ CONFIGURACIÓN DE IMAGEN DE FONDO
config.background = {
	{
		source = {
			-- ⚠️ REEMPLAZA ESTO CON LA RUTA REAL A TU IMAGEN O WALLPAPER:
			File = "/home/JonkiSnow/Pictures/waifubot.jpg",
		},
		-- "Cover" ajusta la imagen para llenar toda la pantalla sin deformarse
		height = "Contain",
		width = "Cover",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		horizontal_align = "Center",
		vertical_align = "Middle",
		-- Oscurece la imagen de fondo (0.15 = 15% de brillo) para leer el texto cómodamente
		hsb = { brightness = 0.03},
	},
}

-- 🪟 DETALLES VISUALES DE LA VENTANA
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 15,
}
config.hide_tab_bar_if_only_one_tab = false-- Oculta la barra si solo tienes una pestaña activa

-- ⌨️ ATAJOS DE TECLADO TRADICIONALES (Copiado y pegado rápido)
config.keys = {
	{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
}

return config
