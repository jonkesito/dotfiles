vim.g.netrw_banner = 0

vim.g.deprecated_warnings = false

vim.opt.nu = true
vim.opt.relativenumber = true

-- =====================================================================
-- CONFIGURACIÓN DE PORTAPAPELES FORZADO PARA ARCH LINUX (WAYLAND)
-- =====================================================================
vim.opt.clipboard = "unnamedplus"

-- Definir explícitamente el proveedor nativo para wl-clipboard
vim.g.clipboard = {
	name = "wl-internal",
	copy = {
		["+"] = "wl-copy --type text/plain",
		["*"] = "wl-copy --type text/plain",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline",
	},
	cache = {
		enabled = true,
	},
}

-- 1. PEGAR EN MODO NORMAL: Presiona <Espacio>p para traer el texto del navegador
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Pegar portapapeles del sistema" })

-- 2. COPIAR EN MODO VISUAL: Selecciona y presiona <Espacio>y para mandarlo al navegador
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copiar al portapapeles del sistema" })

-- 3. PEGAR EN MODO INSERCIÓN: Presiona Ctrl + Shift + V (El estándar universal de Linux)
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { noremap = true, silent = true, desc = "Pegar texto limpio escribiendo" })

-- Ajustes visuales para el menú flotante de autocompletado (mini.completion)
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.pumheight = 10 -- Limita el menú flotante a un máximo de 10 sugerencias por pantalla

vim.opt.hidden = true -- Permite abandonar pestañas con cambios sin que Vim te bloquee

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.guicursor = ""
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- =====================================================================
-- COLORES PERSONALIZADOS PARA MINI.STATUSLINE
-- =====================================================================

-- 1. Colores para el Bloque del Modo Actual (Lado izquierdo)
-- Cambia dinámicamente según estés navegando o escribiendo código
vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#11111b", bg = "#89b4fa", bold = true }) -- Azul para modo Normal
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#11111b", bg = "#a6e3a1", bold = true }) -- Verde para modo Inserción
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#11111b", bg = "#f9e2af", bold = true }) -- Amarillo para modo Visual
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#11111b", bg = "#cdd6f4", bold = true }) -- Blanco para modo Comando

-- 2. Colores para el Bloque Central (Información del archivo y Git)
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#cdd6f4", bg = "#1e1e2e" }) -- Nombre del archivo activo
vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = "#bac2de", bg = "#313244" }) -- Diagnósticos del LSP e info de Git

-- 3. Colores para el Bloque Derecho (Posición de la línea y porcentaje)
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = "#11111b", bg = "#eba0ac", bold = true }) -- Tipo de archivo / Codificación

-- Colores personalizados para los recordatorios de mini.hipatterns
vim.api.nvim_set_hl(0, "MiniHipatternsFixme", { fg = "#11111b", bg = "#f38ba8", bold = true }) -- Rojo intenso
vim.api.nvim_set_hl(0, "MiniHipatternsHack", { fg = "#11111b", bg = "#fab387", bold = true }) -- Naranja
vim.api.nvim_set_hl(0, "MiniHipatternsTodo", { fg = "#11111b", bg = "#f9e2af", bold = true }) -- Amarillo brillante
vim.api.nvim_set_hl(0, "MiniHipatternsNote", { fg = "#11111b", bg = "#89b4fa", bold = true }) -- Azul pastel
