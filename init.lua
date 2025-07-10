vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

local asdf_shims_path = vim.fn.system("asdf where ruby 2>/dev/null | xargs dirname 2>/dev/null")
if asdf_shims_path ~= "" then
  vim.env.PATH = vim.env.PATH .. ":" .. asdf_shims_path:gsub("\n", "")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("zmum.plugins", {})

require("zmum")
