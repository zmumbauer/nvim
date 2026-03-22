local function parse_version(path)
  local version = path:match("(%d+%.%d+%.%d+)$")
  if not version then
    return nil
  end

  local major, minor, patch = version:match("^(%d+)%.(%d+)%.(%d+)$")
  if not major then
    return nil
  end

  return {
    raw = version,
    major = tonumber(major),
    minor = tonumber(minor),
    patch = tonumber(patch),
  }
end

local function version_is_newer(a, b)
  if a.major ~= b.major then
    return a.major > b.major
  end

  if a.minor ~= b.minor then
    return a.minor > b.minor
  end

  return a.patch > b.patch
end

local function find_asdf_node_22()
  local installs_root = vim.fn.expand("~/.asdf/installs/nodejs")
  local matches = vim.fn.globpath(installs_root, "22.*", false, true)
  local versions = {}

  for _, match in ipairs(matches) do
    local parsed = parse_version(match)
    if parsed then
      parsed.path = match .. "/bin/node"
      if vim.fn.executable(parsed.path) == 1 then
        versions[#versions + 1] = parsed
      end
    end
  end

  table.sort(versions, function(a, b)
    return version_is_newer(a, b)
  end)

  return versions[1] and versions[1].path or nil
end

local function resolve_copilot_node()
  if vim.env.NVIM_COPILOT_NODE and vim.fn.executable(vim.env.NVIM_COPILOT_NODE) == 1 then
    return vim.env.NVIM_COPILOT_NODE
  end

  return find_asdf_node_22() or "node"
end

return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      opts.copilot_node_command = resolve_copilot_node()
    end,
  },
}
