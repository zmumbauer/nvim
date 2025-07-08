require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    ruby = { "rubocop" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
  },
})
