local M = {}

local fallback = {
  base = "#15191f",
  panel = "#1b2129",
  surface = "#232a33",
  text = "#dcdcdc",
  muted = "#8b94a7",
  accent = "#a7abf2",
  success = "#88c0a8",
  warning = "#c4a96d",
  error = "#dd7975",
}

local function get_hl(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  return ok and hl or {}
end

local function to_hex(value)
  if type(value) ~= "number" then
    return nil
  end

  return string.format("#%06x", value)
end

local function pick(name, attr, default)
  return to_hex(get_hl(name)[attr]) or default
end

local function palette()
  return {
    base = pick("Normal", "bg", fallback.base),
    panel = fallback.panel,
    surface = fallback.surface,
    text = pick("Normal", "fg", fallback.text),
    muted = pick("Comment", "fg", fallback.muted),
    accent = pick("Directory", "fg", fallback.accent),
    success = pick("String", "fg", fallback.success),
    warning = pick("DiagnosticWarn", "fg", fallback.warning),
    error = pick("DiagnosticError", "fg", fallback.error),
  }
end

local function selected(base)
  return {
    fg = base.text,
    bg = base.base,
    bold = true,
    italic = false,
    underline = true,
    sp = base.accent,
  }
end

function M.build_highlights()
  local colors = palette()
  local selected_hl = selected(colors)

  return {
    fill = { fg = colors.muted, bg = colors.panel },
    background = { fg = colors.muted, bg = colors.panel },
    buffer = { fg = colors.muted, bg = colors.panel },
    buffer_visible = { fg = colors.muted, bg = colors.surface },
    buffer_selected = selected_hl,
    tab = { fg = colors.muted, bg = colors.panel },
    tab_selected = selected_hl,
    tab_close = { fg = colors.muted, bg = colors.panel },
    close_button = { fg = colors.muted, bg = colors.panel },
    close_button_visible = { fg = colors.muted, bg = colors.surface },
    close_button_selected = {
      fg = colors.text,
      bg = colors.base,
      italic = false,
      underline = true,
      sp = colors.accent,
    },
    numbers = { fg = colors.muted, bg = colors.panel },
    numbers_visible = { fg = colors.muted, bg = colors.surface },
    numbers_selected = selected_hl,
    diagnostic = { fg = colors.muted, bg = colors.panel },
    diagnostic_visible = { fg = colors.muted, bg = colors.surface },
    diagnostic_selected = selected_hl,
    hint = { fg = colors.muted, bg = colors.panel },
    hint_visible = { fg = colors.muted, bg = colors.surface },
    hint_selected = {
      fg = colors.accent,
      bg = colors.base,
      underline = true,
      sp = colors.accent,
    },
    hint_diagnostic = { fg = colors.muted, bg = colors.panel },
    hint_diagnostic_visible = { fg = colors.muted, bg = colors.surface },
    hint_diagnostic_selected = {
      fg = colors.accent,
      bg = colors.base,
      underline = true,
      sp = colors.accent,
    },
    info = { fg = colors.muted, bg = colors.panel },
    info_visible = { fg = colors.muted, bg = colors.surface },
    info_selected = {
      fg = colors.accent,
      bg = colors.base,
      underline = true,
      sp = colors.accent,
    },
    info_diagnostic = { fg = colors.muted, bg = colors.panel },
    info_diagnostic_visible = { fg = colors.muted, bg = colors.surface },
    info_diagnostic_selected = {
      fg = colors.accent,
      bg = colors.base,
      underline = true,
      sp = colors.accent,
    },
    warning = { fg = colors.muted, bg = colors.panel },
    warning_visible = { fg = colors.muted, bg = colors.surface },
    warning_selected = {
      fg = colors.warning,
      bg = colors.base,
      underline = true,
      sp = colors.warning,
    },
    warning_diagnostic = { fg = colors.muted, bg = colors.panel },
    warning_diagnostic_visible = { fg = colors.muted, bg = colors.surface },
    warning_diagnostic_selected = {
      fg = colors.warning,
      bg = colors.base,
      underline = true,
      sp = colors.warning,
    },
    error = { fg = colors.muted, bg = colors.panel },
    error_visible = { fg = colors.muted, bg = colors.surface },
    error_selected = {
      fg = colors.error,
      bg = colors.base,
      underline = true,
      sp = colors.error,
    },
    error_diagnostic = { fg = colors.muted, bg = colors.panel },
    error_diagnostic_visible = { fg = colors.muted, bg = colors.surface },
    error_diagnostic_selected = {
      fg = colors.error,
      bg = colors.base,
      underline = true,
      sp = colors.error,
    },
    modified = { fg = colors.success, bg = colors.panel },
    modified_visible = { fg = colors.success, bg = colors.surface },
    modified_selected = {
      fg = colors.success,
      bg = colors.base,
      italic = false,
      underline = true,
      sp = colors.accent,
    },
    duplicate = { fg = colors.muted, bg = colors.panel, italic = true },
    duplicate_visible = { fg = colors.muted, bg = colors.surface, italic = true },
    duplicate_selected = {
      fg = colors.muted,
      bg = colors.base,
      italic = true,
      underline = true,
      sp = colors.accent,
    },
    separator = { fg = colors.surface, bg = colors.panel },
    separator_visible = { fg = colors.surface, bg = colors.surface },
    separator_selected = {
      fg = colors.surface,
      bg = colors.base,
      underline = true,
      sp = colors.accent,
    },
    tab_separator = { fg = colors.surface, bg = colors.panel },
    tab_separator_selected = {
      fg = colors.surface,
      bg = colors.base,
      italic = false,
      underline = true,
      sp = colors.accent,
    },
    indicator_selected = {
      fg = colors.accent,
      bg = colors.base,
      italic = false,
      underline = true,
      sp = colors.accent,
    },
    indicator_visible = { fg = colors.surface, bg = colors.surface },
    pick = { fg = colors.error, bg = colors.panel, bold = true },
    pick_visible = { fg = colors.error, bg = colors.surface, bold = true },
    pick_selected = {
      fg = colors.error,
      bg = colors.base,
      bold = true,
      italic = false,
      underline = true,
      sp = colors.error,
    },
    trunc_marker = { fg = colors.muted, bg = colors.panel },
    group_separator = { fg = colors.surface, bg = colors.panel },
    offset_separator = { fg = colors.surface, bg = colors.panel },
  }
end

function M.apply_tabline()
  local colors = palette()

  vim.api.nvim_set_hl(0, "TabLine", { fg = colors.muted, bg = colors.panel })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.panel })
  vim.api.nvim_set_hl(0, "TabLineSel", {
    fg = colors.text,
    bg = colors.base,
    bold = true,
    underline = true,
    sp = colors.accent,
  })
end

return M
