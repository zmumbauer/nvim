require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "solargraph", "jsonls", "emmet_ls", "bashls" },
    automatic_installation = true,
})

local handlers = require("zmum.lsp.handlers")

local servers = { "lua_ls", "solargraph", "jsonls", "emmet_ls", "bashls" }
local use_vim_lsp_api = vim.lsp and vim.lsp.config and vim.lsp.enable

local legacy_lspconfig = nil
if not use_vim_lsp_api then
    legacy_lspconfig = require("lspconfig")
end

for _, server_name in ipairs(servers) do
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    local require_ok, conf_opts = pcall(require, "zmum.lsp.settings." .. server_name)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    if use_vim_lsp_api then
        vim.lsp.config(server_name, opts)
        vim.lsp.enable(server_name)
    else
        legacy_lspconfig[server_name].setup(opts)
    end
end
