vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd user/repo1 user/repo2)" })

-- Pack Delete and Update cmds are built-in on Nightly 0.13
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
	-- checks if any argument is passed
    if opts.args:match("%S") then
        -- update specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
		-- update only specified plugins
        vim.pack.update(plugins)
    else
        -- update all
        vim.pack.update()
    end
end, { nargs = "*", desc = "Update all plugins or specific ones" })
-- Crear el comando nativo :LspStatus para ver qué servidores vigilan tu archivo
vim.api.nvim_create_user_command("LspStatus", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        vim.notify("📴 No hay servidores LSP activos en este archivo.", vim.log.levels.WARN)
        return
    end
    
    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end
    vim.notify("🚀 Servidores LSP activos: " .. table.concat(names, ", "), vim.log.levels.INFO)
end, {})


