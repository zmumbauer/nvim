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
  markdown = { "prettierd", "prettier" },
  },
  formatters = {
    shfmt = {
      args = { "-i", "2" }, -- Example: Use 2-space indentation for shfmt
    },
  },
})
