local lspconfig = vim.lsp.config
require("lspconfig.configs")

local lsp = {}

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- Navegación e Inspección
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Acciones Rápidas y Diagnósticos
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

-- 2. Capacidades de autocompletado asíncrono
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.formatting = { dynamicRegistration = true }

-- 3. EL NUEVO ESTÁNDAR DE MASON (Neovim 0.11+ / 0.12)
-- En el ecosistema moderno, vim.lsp.config activa todo automáticamente.

lspconfig("pyright", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("pyright")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*.py",
	callback = function()
		local file = vim.fn.expand("%")
		vim.fn.system("black --quiet " .. vim.fn.shellescape(file))
		vim.cmd("edit!")
	end,
})

lspconfig("vue_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		typescript = {
			tsdk = "/usr/lib/node_modules/typescript/lib",
		},
	},
})

vim.lsp.enable("vue_ls")

lspconfig("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "vue" },
})

vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", ".html", "*.css", "*.vue" },
	callback = function()
		local file = vim.fn.expand("%")
		vim.fn.system("prettier --write --loglevel silent " .. vim.fn.shellescape(file))
		vim.cmd("edit!")
	end,
})

lspconfig("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = vim.fs.root(0, { ".git", "init.lua", "package.json" }),
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "space",
					indent_size = 4,
				},
			},
		},
	},
})

vim.lsp.enable("lua_ls")

return lsp
