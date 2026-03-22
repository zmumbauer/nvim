return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters = opts.formatters or {}

      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.ruby = { "rubocop" }
      opts.formatters_by_ft.javascript = { "prettierd", "prettier" }
      opts.formatters_by_ft.typescript = { "prettierd", "prettier" }
      opts.formatters_by_ft.css = { "prettierd", "prettier" }
      opts.formatters_by_ft.html = { "prettierd", "prettier" }
      opts.formatters_by_ft.json = { "prettierd", "prettier" }
      opts.formatters_by_ft.yaml = { "prettierd", "prettier" }
      opts.formatters_by_ft.markdown = { "prettierd", "prettier" }

      opts.formatters.shfmt = vim.tbl_deep_extend("force", opts.formatters.shfmt or {}, {
        args = { "-i", "2" },
      })
    end,
  },
}
