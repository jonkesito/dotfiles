vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<leader>q", "<cmd>wq<CR>", { desc = "quit" })

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set("v", "<", "<gv", { desc = "unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "indent and keep selection" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without yanking" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

-- =====================================================================
-- CONTROL INTERACTIVO DE COLORES (MINI.COLORS)
-- =====================================================================

-- 1. Presiona <Leader>ct (Color Transparency) para quitar el fondo de CUALQUIER tema activo
vim.keymap.set("n", "<leader>ct", function()
    local colors_ok, colors = pcall(require, "mini.colors")
    if colors_ok then
        -- Obtiene el objeto del tema actual, remueve el fondo y lo aplica en caliente
        local cs = colors.get_colorscheme()
        cs:add_transparency()
        cs:apply()
        vim.notify("✨ Modo transparente activado.", vim.log.levels.INFO)
    end
end, { desc = "Activar fondo transparente" })

-- 2. Presiona <Leader>ci (Color Interactive) para abrir la consola de diseño en vivo
vim.keymap.set("n", "<leader>ci", function()
    require("mini.colors").interactive()
end, { desc = "Consola interactiva de colores" })


-- Salir de modo inserción con jk o kj
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, nowait = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true, nowait = true })

-- Mover bloques de texto en modo visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })


-- =====================================================================
-- NAVEGACIÓN VISUAL DE PESTAÑAS (MINI.TABLINE / BÚFERES)
-- =====================================================================

-- Shift + L (L mayúscula) -> Moverte a la pestaña de la DERECHA
vim.keymap.set("n", "<S-l>", "<CMD>bnext<CR>", { noremap = true, silent = true, desc = "Siguiente pestaña" })

-- Shift + H (H mayúscula) -> Moverte a la pestaña de la IZQUIERDA
vim.keymap.set("n", "<S-h>", "<CMD>bprevious<CR>", { noremap = true, silent = true, desc = "Pestaña anterior" })

-- <Leader>bd (Espacio + b + d) -> Cerrar la pestaña actual (Borrar búfer)
vim.keymap.set("n", "<leader>bb", "<CMD>bdelete<CR>", { noremap = true, silent = true, desc = "Cerrar pestaña actual" })




vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- =====================================================================
-- CONTROL INTEGRADO DE GIT (MINI.GIT)
-- =====================================================================

-- 1. Ver el estado de Git (Git Status) en una ventana dividida rápida
vim.keymap.set("n", "<leader>gs", "<CMD>Git status<CR>", { silent = true, desc = "Git Status" })

-- 2. Hacer un commit rápido de tus cambios guardados
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { desc = "Git Commit" })

-- 3. Ver qué datos de Git corresponden a la línea bajo el cursor (Contexto)
vim.keymap.set("n", "<leader>gh", function()
	require("mini.git").show_at_cursor()
end, { desc = "Mostrar info de Git bajo el cursor" })
