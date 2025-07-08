require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "solargraph", "jsonls", "emmet_ls" },
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local handlers = require("zmum.lsp.handlers")

local servers = { "lua_ls", "solargraph", "jsonls", "emmet_ls" }

for _, server_name in ipairs(servers) do
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    local require_ok, conf_opts = pcall(require, "zmum.lsp.settings." .. server_name)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server_name].setup(opts)
end

