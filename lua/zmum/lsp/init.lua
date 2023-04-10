local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("zmum.lsp.mason")
require("zmum.lsp.handlers").setup()
require("zmum.lsp.null-ls")
