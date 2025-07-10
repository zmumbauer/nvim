local lint = require("lint")

lint.linters_by_ft = {
  lua = { "luacheck" },
  ruby = { "rubocop" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  sh = { "shellcheck" },
  markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
