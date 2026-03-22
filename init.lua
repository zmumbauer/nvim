local uv = vim.uv or vim.loop

local function normalize(path)
  local normalized = vim.fn.fnamemodify(vim.fn.expand(path), ":p")
  return (normalized:gsub("/$", ""))
end

local function join(...)
  local path = table.concat({ ... }, "/")
  return (path:gsub("//+", "/"))
end

local function file_exists(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "file"
end

local function find_base_config()
  local config_dir = vim.fn.stdpath("config")
  local candidates = {}

  if vim.env.NVIM_BASE_CONFIG and vim.env.NVIM_BASE_CONFIG ~= "" then
    table.insert(candidates, vim.env.NVIM_BASE_CONFIG)
  end

  table.insert(candidates, join(config_dir, "vendor", "neovim-dotfiles"))
  table.insert(candidates, join(config_dir, "..", "neovim-dotfiles"))
  table.insert(candidates, join(config_dir, "..", "..", "code", "neovim-dotfiles"))
  table.insert(candidates, "~/code/neovim-dotfiles")

  for _, candidate in ipairs(candidates) do
    local base_path = normalize(candidate)
    if file_exists(join(base_path, "init.lua")) then
      return base_path
    end
  end

  return nil
end

local base_config = find_base_config()

if not base_config then
  error(
    "Unable to locate the base neovim-dotfiles repo. Set NVIM_BASE_CONFIG or clone it to ./vendor/neovim-dotfiles, ~/.config/neovim-dotfiles, or ~/code/neovim-dotfiles."
  )
end

vim.opt.rtp:prepend(base_config)
package.path = table.concat({
  join(base_config, "lua", "?.lua"),
  join(base_config, "lua", "?", "init.lua"),
  package.path,
}, ";")
dofile(join(base_config, "init.lua"))
