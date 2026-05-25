
require("vim._core.ui2").enable({})

-- Carga tus opciones, comandos y paquetes individuales
require("keymaps")
require("options")
require("pack")
require("commands")
require("treesitter")
require("lsp")

require("catppuccin-vue")

vim.cmd("colorscheme catppuccin-mocha")
