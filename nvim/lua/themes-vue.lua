require("catppuccin").setup({
	flavour = "mocha",
	custom_highlights = function(colors)
		return {
			-- Esto hace que <UserCard> sea Morado brillante (lavender)
			["@tag.component.vue"] = { fg = colors.lavender, bold = true },

			-- Opcional: Si quieres que los cierres </UserCard> también cambien
			["@tag.abstract.vue"] = { fg = colors.lavender },

			-- Mantiene las etiquetas normales como <div> en el color estándar (ej: Peach/Red)
			["@tag.vue"] = { fg = colors.red },

			-- NUEVO: La etiqueta <template> en Amarillo, negrita y cursiva
			["@tag.template.vue"] = { fg = colors.yellow, bold = true, italic = true },
		}
	end,
})

-- Configurar los colores personalizados del nuevo tema
require("tokyonight").setup({
	on_highlights = function(highlights, colors)
		-- Enlazas tu etiqueta al color que más te guste de este tema (ej: el morado 'purple')
		highlights["@tag.component.vue"] = { fg = colors.purple, bold = true }
		highlights["@tag.template.vue"] = { fg = colors.yellow, bold = true, italic = true }
		highlights["@tag.vue"] = { fg = colors.red }
	end,
})

-- Activar el nuevo colorscheme
vim.cmd.colorscheme("tokyonight-storm")
