require("catppuccin").setup({
	flavour = "mocha",
	custom_highlights = function(colors)
		return {
			-- Esto hace que <UserCard> sea Morado brillante (Mauve)
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

vim.cmd.colorscheme("catppuccin-mocha")
