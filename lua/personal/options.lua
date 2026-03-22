vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

local asdf_shims_path = vim.fn.system("asdf where ruby 2>/dev/null | xargs dirname 2>/dev/null")
if vim.v.shell_error == 0 and asdf_shims_path ~= "" then
  local shims_dir = asdf_shims_path:gsub("%s+$", "")
  if not vim.env.PATH:find(shims_dir, 1, true) then
    vim.env.PATH = vim.env.PATH .. ":" .. shims_dir
  end
end

vim.opt.mouse = "a"
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 50
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

local ok, treesitter_utils = pcall(require, "config.utils.treesitter")
if ok then
  treesitter_utils.build = function(cb)
    treesitter_utils.ensure_treesitter_cli(function(_, err)
      local healthy, health = treesitter_utils.check()
      if healthy then
        return cb()
      end

      local lines = { "Unmet requirements for **nvim-treesitter** `main`:" }
      local keys = vim.tbl_keys(health)
      table.sort(keys)
      for _, key in ipairs(keys) do
        lines[#lines + 1] = ("- %s `%s`"):format(health[key] and "✅" or "❌", key)
      end

      vim.list_extend(lines, {
        "",
        "See the requirements at [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#requirements)",
        "Run `:checkhealth nvim-treesitter` for more information.",
      })
      vim.list_extend(lines, err and { "", err } or {})
      vim.notify(table.concat(lines, "\n"), vim.log.levels.ERROR, { title = "Treesitter" })
    end)
  end
end

local lazy_ok, lazy_config = pcall(require, "lazy.core.config")
if lazy_ok then
  lazy_config.options.concurrency = 4
  if lazy_config.options.checker then
    lazy_config.options.checker.concurrency = 2
  end
end
